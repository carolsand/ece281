/*
 * File:   FinalEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Final file to set up typical EventCheckers for the  Events and Services
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

#include "FinalEventChecker.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"
#include "Robot.h"
#include "Robot_HSM.h"
#include <stdio.h>

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 175
#define IS_ON 1
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

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function CheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */
uint8_t CheckBattery(void) {
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

    if (batVoltage > BATTERY_DISCONNECT_THRESHOLD) { // is battery connected?
        curEvent = BATTERY_CONNECTED;
    } else {
        curEvent = BATTERY_DISCONNECTED;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = batVoltage;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}

uint8_t CheckTapeSensors(void) {
    static ES_EventTyp_t lastEventFL = FOUND_TAPE;
    static ES_EventTyp_t lastEventFR = FOUND_TAPE;
    static ES_EventTyp_t lastEventRL = FOUND_TAPE;
    static ES_EventTyp_t lastEventRR = FOUND_TAPE;

    ES_EventTyp_t curEventFL;
    ES_EventTyp_t curEventFR;
    ES_EventTyp_t curEventRL;
    ES_EventTyp_t curEventRR;
    ES_Event thisEvent;

    uint8_t returnVal = FALSE;
    uint16_t statusFL = Robot_ReadFrontLeftTape(); // read the FL tape sensor
    uint16_t statusFR = Robot_ReadFrontRightTape(); // read the FR tape sensor
    uint16_t statusRL = Robot_ReadRearLeftTape(); // read the RL tape sensor
    uint16_t statusRR = Robot_ReadRearRightTape(); // read the RR tape sensor

    if (statusFL == TAPE_PRESENT) { // is tape sensor tripped?
        curEventFL = FOUND_TAPE;
    } else {
        curEventFL = ES_NO_EVENT;
    }

    if (statusFR == TAPE_PRESENT) { // is tape sensor tripped?
        curEventFR = FOUND_TAPE;
    } else {
        curEventFR = ES_NO_EVENT;
    }
    if (statusRL == TAPE_PRESENT) { // is tape sensor tripped?
        curEventRL = FOUND_TAPE;
    } else {
        curEventRL = ES_NO_EVENT;
    }
    if (statusRR == TAPE_PRESENT) { // is tape sensor tripped?
        curEventRR = FOUND_TAPE;
    } else {
        curEventRR = ES_NO_EVENT;
    }


    if (curEventFL != lastEventFL) { // check for change from last time
        thisEvent.EventType = curEventFL;
        thisEvent.EventParam = FrontLeft;
        returnVal = TRUE;
        lastEventFL = curEventFL; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventFR != lastEventFR) { // check for change from last time
        thisEvent.EventType = curEventFR;
        thisEvent.EventParam = FrontRight;
        returnVal = TRUE;
        lastEventFR = curEventFR; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventRL != lastEventRL) { // check for change from last time
        thisEvent.EventType = curEventRL;
        thisEvent.EventParam = RearLeft;
        returnVal = TRUE;
        lastEventRL = curEventRL; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventRR != lastEventRR) { // check for change from last time
        thisEvent.EventType = curEventRR;
        thisEvent.EventParam = RearRight;
        returnVal = TRUE;
        lastEventRR = curEventRR; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif
    }
    return (returnVal);
}

uint8_t CheckBumpers(void) {
    static ES_EventTyp_t lastEventFL = BUMP;
    static ES_EventTyp_t lastEventFR = BUMP;
    static ES_EventTyp_t lastEventRL = BUMP;
    static ES_EventTyp_t lastEventRR = BUMP;

    ES_EventTyp_t curEventFL;
    ES_EventTyp_t curEventFR;
    ES_EventTyp_t curEventRL;
    ES_EventTyp_t curEventRR;
    ES_Event thisEvent;

    uint8_t returnVal = FALSE;
    uint16_t statusFL = Robot_ReadFrontLeftBumper(); // read the FL bumper
    uint16_t statusFR = Robot_ReadFrontRightBumper(); // read the FR bumper
    uint16_t statusRL = Robot_ReadRearLeftBumper(); // read the RL bumper
    uint16_t statusRR = Robot_ReadRearRightBumper(); // read the RR bumper

    if (statusFL == BUMPER_TRIPPED) { // is bumper tripped?
        curEventFL = BUMP;
    } else {
        curEventFL = ES_NO_EVENT;
    }

    if (statusFR == BUMPER_TRIPPED) { // is bumper tripped?
        curEventFR = BUMP;
    } else {
        curEventFR = ES_NO_EVENT;
    }
    if (statusRL == BUMPER_TRIPPED) { // is bumper tripped?
        curEventRL = BUMP;
    } else {
        curEventRL = ES_NO_EVENT;
    }
    if (statusRR == BUMPER_TRIPPED) { // is bumper tripped?
        curEventRR = BUMP;
    } else {
        curEventRR = ES_NO_EVENT;
    }


    if (curEventFL != lastEventFL) { // check for change from last time
        thisEvent.EventType = curEventFL;
        thisEvent.EventParam = FrontLeft;
        returnVal = TRUE;
        lastEventFL = curEventFL; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventFR != lastEventFR) { // check for change from last time
        thisEvent.EventType = curEventFR;
        thisEvent.EventParam = FrontRight;
        returnVal = TRUE;
        lastEventFR = curEventFR; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventRL != lastEventRL) { // check for change from last time
        thisEvent.EventType = curEventRL;
        thisEvent.EventParam = RearLeft;
        returnVal = TRUE;
        lastEventRL = curEventRL; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    } else if (curEventRR != lastEventRR) { // check for change from last time
        thisEvent.EventType = curEventRR;
        thisEvent.EventParam = RearRight;
        returnVal = TRUE;
        lastEventRR = curEventRR; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostRobot_HSM(thisEvent);
#else
        SaveEvent(thisEvent);
#endif
    }
    return (returnVal);
}

uint8_t CheckBeacon(void) {
    ;
}

uint8_t CheckTrackwire(void) {
    ;
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