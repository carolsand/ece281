/*
 * STUDENT NAMES: cris vasquez and kyle chambers
 * ECE118/218: Spring 2024
 * Lab 0
 * 
 * File: BattBumpService.h
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a simple service to work with the Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 * Created on 23/Oct/2011
 * Updated on 13/Nov/2013
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "BOARD.h"
#include "AD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BattBumpService.h"
#include <stdio.h>
#include "roach.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

#define BATTERY_DISCONNECT_THRESHOLD 175
#define TIMER_0_TICKS 200 //frequency is 5Hz

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/
/* You will need MyPriority and maybe a state variable; you may need others
 * as well. */

static uint8_t MyPriority;

static ES_EventTyp_t lastBumperState = NOT_PUSHED; //initializing lastBumperState so event checker has something to compare to cuurentBumperState
static uint16_t lastBumperValue = 0;               //initializing lastBumperValue so event checker has something to compare to cuurentBumperValue

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitBattBumpService(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunBattBumpService function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitBattBumpService(uint8_t Priority) {
    ES_Event ThisEvent;

    MyPriority = Priority;

    // in here you write your initialization code
    // this includes all hardware and software initialization
    // that needs to occur.
    ES_Timer_InitTimer(BATTERY_SERVICE_TIMER, TIMER_0_TICKS);
    ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, TIMER_0_TICKS);
    
    // post the initial transition event
    ThisEvent.EventType = ES_INIT;
    
    if (ES_PostToService(MyPriority, ThisEvent) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostBattBumpService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostBattBumpService(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunBattBumpService(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the service,
 *        as this is called any time a new event is passed to the event queue. 
 * @note Remember to rename to something appropriate.
 *       Returns ES_NO_EVENT if the event have been "consumed." 
 * @author J. Edward Carryer, 2011.10.23 19:25 */
ES_Event RunBattBumpService(ES_Event ThisEvent) {
    ES_Event ReturnEvent;
    ReturnEvent.EventType = ES_NO_EVENT; // assume no errors

    /********************************************
     in here you write your service code
     *******************************************/
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

    ES_EventTyp_t currentBumperState; //initializing the variables we will use for bumper event checker
    uint16_t currentBumperValue;

    switch (ThisEvent.EventType) {
        case ES_INIT:
            // No hardware initialization or single time setups, those
            // go in the init function above.
            //
            // This section is used to reset service for some reason
            break;
        case ES_TIMERACTIVE:
        case ES_TIMERSTOPPED:
            break;
        case ES_TIMEOUT:

            /* ---------- BATTERY EVENT DETECTOR ---------------------*/

            if (ThisEvent.EventParam == BATTERY_SERVICE_TIMER) { //only execute code if service timer was the one that timed out
                ES_Timer_InitTimer(BATTERY_SERVICE_TIMER, TIMER_0_TICKS);
                if (batVoltage > BATTERY_DISCONNECT_THRESHOLD) { // is battery connected?
                    curEvent = BATTERY_CONNECTED;
                } else {
                    curEvent = BATTERY_DISCONNECTED;
                }
                if (curEvent != lastEvent) { // check for change from last time
                    ReturnEvent.EventType = curEvent;
                    ReturnEvent.EventParam = batVoltage;
                    lastEvent = curEvent; // update history
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                    PostGenericService(ReturnEvent);
#else
                    PostBattBumpService(ReturnEvent);
#endif   
                }
            }

            /* ---------- BUMPERS EVENT DETECTOR ---------------------*/

            if (ThisEvent.EventParam == BUMPER_SERVICE_TIMER) { //only execute this code if bumper timer timed out

                // since the timer has timed out, then we want to restart it
                ES_Timer_InitTimer(BUMPER_SERVICE_TIMER, TIMER_0_TICKS);

                //proceed to event checking

                //read the current bumper value 
                currentBumperValue = Roach_ReadBumpers();

                /*  LINES 179-184 WILL WILL SEND BUMP EVENTS EVEN IF ONE 
                    BUMPER IS ALREADY PRESSED. there's a TA/tutor that wants
                    it like this I was told. IF FOR SOME REASON WHO EVER IS
                    CHECKING US OFF WANTS LESS BUMP EVENTS:
                    COMMENT LINES 179-184 AND UNCOMMENT LINES 190-195 */

//                if (currentBumperValue != lastBumperValue) { //compare current bumper value with last bumper value
//                    
//                    currentBumperState = PUSHED; //if they don't match then update the state event to PUSHED
//                    lastBumperValue = currentBumperValue; //update lastBumperValue with the current value
//                } else { //if the current bumper value has not changed from last bumper
//                    currentBumperState = NOT_PUSHED; //value then we can assume that the state is now NOT_PUSHED
//                }

                /*  LINES 190-195 SENDS LESS BUMP EVENTS. WILL NOT SEND
                 *  BUMP EVENT IF YOU PUSH ANOTHER BUMPER WHILE ONE IS
                 *  BEING HELD DOWN  */

                                if (currentBumperValue != lastBumperValue) { //compare current bumper value with last bumper value
                                    currentBumperState = PUSHED;             //if they don't match then update the state event to PUSHED
                                    
                                }    
                                if (currentBumperValue == 0) {       //if the current bumper value is 0 then we can assume that the state is now NOT_PUSHED
                                    currentBumperState = NOT_PUSHED; //this is needed to update the state back to not pushed
                                }                                    // or else it'll forever stay as a PUSHED state

                // now that we have updated the state of the bumper we will 
                // compare it to the last bumper state. if they are different
                // then we need to post an event i.e. let the framework know that
                // an event has occured
                if (currentBumperValue != lastBumperValue) { //event detected

                    // update ReturnEvent with the information of this event
                    lastBumperValue = currentBumperValue;
                    ReturnEvent.EventType = currentBumperState;
                    ReturnEvent.EventParam = currentBumperValue;

                    // update lastBumperState to the new state
                    lastBumperState = currentBumperState;

                    //post the event i.e. tell the framework an event has occured
#ifndef SIMPLESERVICE_TEST           // keep this as is for test harness
                    PostGenericService(ReturnEvent);
#else
                    PostBattBumpService(ReturnEvent);
#endif           
                }
            }
            break;
#ifdef SIMPLESERVICE_TEST     // keep this as is for test harness      
        default:
            printf("\r\nEvent: %s\tParam: 0x%X",
                    EventNames[ThisEvent.EventType], ThisEvent.EventParam);
            break;
#endif
    }

    return ReturnEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONs                                                           *
 ******************************************************************************/

