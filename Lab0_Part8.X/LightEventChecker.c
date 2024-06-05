/*
 * 
 * STUDENT NAMES: cris vasquez and kyle chambers
 * ECE118/218: Spring 2024
 * Lab 0
 * 
 * File:   LightEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Template file to set up typical EventCheckers for the  Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the
 * names will have to be changed to match your code.
 *
 * This EventCheckers file will work with both FSM's and HSM's.
 *
 * Remember that EventCheckers should only return TRUE when an event has occured,
 * and that the event is a TRANSITION between two detectable differences. They
 * should also be atomic and run as fast as possible for good results.
 *
 * This file includes a test harness that will run the event detectors listed in the
 * ES_Configure file in the project, and will conditionally compile main if the macro
 * EVENTCHECKER_TEST is defined (either in the project or in the file). This will allow
 * you to check you event detectors in their own project, and then leave them untouched
 * for your project unless you need to alter their post functions.
 *
 * Created on September 27, 2013, 8:37 AM
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "LightEventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"
#include "roach.h"
#include "TemplateHSM.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define DARK_THRESHOLD 900
#define LIGHT_THRESHOLD 470
/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

//#define EVENTCHECKER_TEST
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)

static const char *eventName;
static ES_Event storedEvent;
#endif

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

static ES_EventTyp_t lastLightState = LIGHT; //initializing last light state so event checker has something to compare to current light state
/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function CheckLight(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is an event checker that checks the light level
 *        against a fixed threshold (#defined in the .c file). The function will post an event
 *        of either DARK or LIGHT if the light sensor is exposed to no light or light
 *        with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @author Gabriel H Elkaim, 2013.09.27 09:18 
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08
 * @modified Cris Vasquez/Kyle Chamber 2024.04.10 1:00 */
uint8_t CheckLight(void) {
    
    static ES_EventTyp_t currentLightState; //initialize variables that will hold current state n value
    static uint16_t currentLightValue;      //it must be static type variable or else the GUI is not happy (constant restarting)
    
    ES_Event ThisEvent;         //initialize the event variable that we will be posting to framework
    uint8_t returnVal = FALSE;  //assume we don't have to return anything
    
    currentLightValue = Roach_LightLevel();    //read the current light level

    if (currentLightValue > LIGHT_THRESHOLD) { //compare it to the threshold values we set
        currentLightState = DARK;              //hope this section is self explanatory 
    }
    if (currentLightValue < LIGHT_THRESHOLD) {
        currentLightState = LIGHT;
    }

    if (currentLightState != lastLightState) {    //if the current state is different from last state then event is detected
        ThisEvent.EventType = currentLightState;  //save the light level information to the event we will be posting
        ThisEvent.EventParam = currentLightValue;
        returnVal = TRUE;                         //set return value to true since we are returning an event i.e. posting an event
        lastLightState = currentLightState;       //update last state to the current state
        PostTemplateHSM(ThisEvent);
//#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
//        PostBattBumpService(ThisEvent); //tell the framework an event has occured !!
//#else
//        SaveEvent(ThisEvent);
//#endif   
    }
    return returnVal;
}

/* 
 * The Test Harness for the event checkers is conditionally compiled using
 * the EVENTCHECKER_TEST macro (defined either in the file or at the project level).
 * No other main() can exist within the project.
 * 
 * It requires a valid ES_Configure.h file in the project with the correct events in 
 * the enum, and the correct list of event checkers in the EVENT_CHECK_LIST.
 * 
 * The test harness will run each of your event detectors identically to the way the
 * ES_Framework will call them, and if an event is detected it will print out the function
 * name, event, and event parameter. Use this to test your event checking code and
 * ensure that it is fully functional.
 * 
 * If you are locking up the output, most likely you are generating too many events.
 * Remember that events are detectable changes, not a state in itself.
 * 
 * Once you have fully tested your event checking code, you can leave it in its own
 * project and point to it from your other projects. If the EVENTCHECKER_TEST marco is
 * defined in the project, no changes are necessary for your event checkers to work
 * with your other projects.
 */
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {
    BOARD_Init();
    /* user initialization code goes here */

    // Do not alter anything below this line
    int i;

    printf("\r\nEvent checking test harness for %s", __FILE__);

    while (1) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();
                    break;
                }

            }
        }
    }
}

void PrintEvent(void) {
    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif