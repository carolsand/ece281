/*
 * File: TemplateSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel Elkaim and Soja-Marie Morgens
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is another template file for the SubHSM's that is slightly differet, and
 * should be used for all of the subordinate state machines (flat or heirarchical)
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "roach.h"
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "TemplateHSM.h"
#include "Driving_Fwd_SubHSM.h"
#include "AD.h" //#include all sub state machines called

/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
//Include any defines you need to do
#define FRONT_LEFT_BUMPER 8
#define FRONT_RIGHT_BUMPER 4
#define REAR_LEFT_BUMPER 2
#define REAR_RIGHT_BUMPER 1
#define LIGHT_OFF_THRESHOLD 600
#define LIGHT_ON_THRESHOLD 470
#define BACKING_UP_TIME 1000
#define TURNING_TIME 300
#define ROACH_SPEED ROACH_MAX_SPEED

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/


typedef enum {
    InitPState,
    DRIVING_FORWARD,
    HIDING,
    BACKING_UP,
} TemplateHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"DRIVING_FORWARD",
	"HIDING",
	"BACKING_UP",
};


/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static TemplateHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitTemplateHSM(uint8_t Priority) {
    MyPriority = Priority;
    // put us into the Initial PseudoState
    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostTemplateHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunTemplateHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    TemplateHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    static uint8_t bumperValue = 0; //initializing variable that will hold the bumper value from event
    static uint8_t lightLevel = 0; //initializing variable that will hold the light level value from event

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Initialize all sub-state machines
                InitDrivingFwdSubHSM();
                // now put the machine into the actual initial state
                nextState = DRIVING_FORWARD;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                ;
            }
            break;

        case DRIVING_FORWARD: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            ThisEvent = RunDrivingFwdSubHSM(ThisEvent);
            switch (ThisEvent.EventType) { // THIS SWITCH CASE IS FOR THE EVENTS THAT OCCUR WITHIN THIS STATE
                case ES_ENTRY: //when we enter this state, drive, and send ES_NO_EVENT after                    
                    //Roach_DriveForward(ROACH_SPEED); // Starts motors
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case PUSHED: // when the bumper(s) gets pushed and the roach is exposed to light
                    nextState = BACKING_UP; // PUSHED event will cause state machine to transition to BACKING_UP state (.. cause we need to back up)
                    makeTransition = TRUE;
                    bumperValue = ThisEvent.EventParam; // save the bumpers that were triggered
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case DARK: // we found a somewhere to hide! transition to hiding state so we can stop the motors
                    nextState = HIDING;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                default: //ignore all other events
                    break;
            }
            break;

        case BACKING_UP: // in the first state, replace this with correct names
            switch (ThisEvent.EventType) { //switch statement that has all the possible cases that ThisEvent can be (only code the event caseS needed for this state, ignore rest)

                case ES_ENTRY: //first thing we want to do when we enter this state is to reverse only if front bumpers were hit

                    //if (bumperValue == FRONT_LEFT_BUMPER || bumperValue == FRONT_RIGHT_BUMPER || bumperValue == (FRONT_LEFT_BUMPER || FRONT_RIGHT_BUMPER)) {
                    if (bumperValue < 4) { //this is a better way of writing the line above, but i'm leaving that there so u know what this means, the line above doesn't work properly unfortunately
                        Roach_Reverse(ROACH_SPEED); //drive opposite direction only if front bumpers were hit
                    }
                    if (bumperValue > 3){ //swap bumperValue conditionals if the roach is not responding to the bumpers correctly
                        Roach_DriveForward(ROACH_SPEED);
                    }
                    //start timer for 1/2s (we only want to back up for half a second))
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME); //reset timer
                    if (lightLevel > LIGHT_OFF_THRESHOLD){
                        ThisEvent.EventType = DARK;
                    }
                    else {
                        ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    }
                    
                  

                case DARK: // ayy we ended up in the dark while reversing, so switch to hiding state so we can stop moving
                    nextState = HIDING;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    

                case ES_TIMEOUT: // one of the timers that we r using for this state has expired

                    // the timer for backing up has finished
                    if (ThisEvent.EventParam == BACKING_UP_TIMER) { //only execute this event if it is the back up timer
                        Roach_Turn(0, 60);
                        ES_Timer_InitTimer(TURN_TIMER, TURNING_TIME); //start new timer for turning
                    }
                    // the timer for turning has finished
                    if (ThisEvent.EventParam == TURN_TIMER) { //roach finished turning go back
                        Roach_Stop(); //stop the turning
                        //now we need to reassess if we should move or stay still
                        lightLevel = Roach_LightLevel(); //read the light sensor
                        if (lightLevel > LIGHT_OFF_THRESHOLD) { // do we need to hide or move?
                            nextState = HIDING;
                            makeTransition = TRUE;
                        } 
                        else if (lightLevel < LIGHT_ON_THRESHOLD) {
                            nextState = DRIVING_FORWARD;
                            makeTransition = TRUE;
                        }
                    }
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    
//            case ES_EXIT:
//                CurrentState = InitPState; 
                default: //ignore all other events
                    break;
            }
            break;

        case HIDING: // we r in zi dark, roach no more move
            switch (ThisEvent.EventType) { // THIS SWITCH CASE IS FOR EVENTS
                case ES_ENTRY: //when we enter this state, stop, and send ES_NO_EVENT after                    
                    Roach_Stop(); // Stop motors
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case PUSHED: // when the bumper(s) gets pushed and the roach is in the dark
                    nextState = BACKING_UP; // PUSHED event will cause state machine to transition to BACKING_UP state (.. cause we need to back up)
                    makeTransition = TRUE;
                    bumperValue = ThisEvent.EventParam; // save the bumpers that were triggered
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case LIGHT: // we are exposed to light! transition to drive forward state so we can start the motors
                    nextState = DRIVING_FORWARD;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                default: //ignore all other events
                    break;
            }
            break;

        default: // all unhandled states fall into here
            CurrentState = InitPState;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunTemplateHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunTemplateHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

void Roach_Stop(void) {
    Roach_LeftMtrSpeed(0);
    Roach_RightMtrSpeed(0);
}

void Roach_DriveForward(char speed) {
    Roach_LeftMtrSpeed(speed);
    Roach_RightMtrSpeed(speed);
}

void Roach_Reverse(char speed) {
    Roach_LeftMtrSpeed(-speed);
    Roach_RightMtrSpeed(-speed);
}

void Roach_SpinLeft(char speed) {
    Roach_LeftMtrSpeed(-speed);
    Roach_RightMtrSpeed(speed);
}

void Roach_SpinRight(char speed) {
    Roach_LeftMtrSpeed(speed);
    Roach_RightMtrSpeed(-speed);
}

void Roach_Turn(char leftSpeed, char rightSpeed) {
    Roach_LeftMtrSpeed(leftSpeed);
    Roach_RightMtrSpeed(rightSpeed);
}