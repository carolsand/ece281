/*
 * File: TemplateFSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a Flat State Machine to work with the Events and Services
 * Frameword (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that this file
 * will need to be modified to fit your exact needs, and most of the names will have
 * to be changed to match your code.
 *
 * This is provided as an example and a good place to start.
 *
 *Generally you will just be modifying the statenames and the run function
 *However make sure you do a find and replace to convert every instance of
 *  "Template" to your current state machine's name
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */

#include "roach.h"



/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "roach.h"
#include "TemplateFSM.h"
#include <BOARD.h>
#include "roach.h"
#include <stdio.h>


/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define FRONT_LEFT_BUMPER 8
#define FRONT_RIGHT_BUMPER 4
#define REAR_LEFT_BUMPER 2
#define REAR_RIGHT_BUMPER 1
#define DRIVE_TIME 1000
#define DANCE_TIME 500
#define LIGHT_OFF_THRESHOLD 900
#define LIGHT_ON_THRESHOLD 470
#define BACKING_UP_TIME 1000
#define TURNING_TIME 750
#define ROACH_SPEED ROACH_MAX_SPEED

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine.*/

// these are our helper functions, will hopefully make code more readable
void Roach_Stop(void); //turns off the motors so the roach will stop moving
void Roach_DriveForward(char speed);
void Roach_Reverse(char speed);
void Roach_SpinLeft(char speed); // tank turn
void Roach_SpinRight(char speed); // tank turn
void Roach_Turn(char leftSpeed, char rightSpeed); //in case we don't want tank turn (one speed must b pos and the other neg))
/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/

/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

typedef enum {
    InitPState,
    DRIVING_FORWARD,
    HIDING,
    BACKING_UP,
    EVADE_FORWARD,
} TemplateFSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"DRIVING_FORWARD",
	"HIDING",
	"BACKING_UP",
	"EVADE_FORWARD",
};


static TemplateFSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateFSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitTemplateFSM(uint8_t Priority) {
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
 * @Function PostTemplateFSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostTemplateFSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateFSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the flat state machine,
 *        as this is called any time a new event is passed to the event queue. This
 *        function will be called recursively to implement the correct order for a
 *        state transition to be: exit current state -> enter next state using the
 *        ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       Returns ES_NO_EVENT if the event have been "consumed."
 * @author J. Edward Carryer, 2011.10.23 19:25 */
ES_Event RunTemplateFSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    TemplateFSMState_t nextState; // <- need to change enum type here

    ES_Tattle(); // trace call stack

    static uint8_t bumperValue = 0; //initializing variable that will hold the bumper value from event
    static uint8_t lightLevel = 0; //initializing variable that will hold the bumper value from event

    switch (CurrentState) { //THIS SWITCH CASE IS FOR THE STATES
        case InitPState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state

                // now put the machine into the actual initial state
                nextState = DRIVING_FORWARD;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

            /*====DRIVING_FORWARD_STATE==================================================*/
        case DRIVING_FORWARD: // while in this state, drive forward
            //ThisEvent, the input argument of RunTemplateFSM, is the event that just happened n needs processing
            switch (ThisEvent.EventType) { // THIS SWITCH CASE IS FOR THE EVENTS THAT OCCUR WITHIN THIS STATE
                case ES_ENTRY: //when we enter this state, drive, and send ES_NO_EVENT after                    
                    Roach_DriveForward(ROACH_SPEED); // Starts motors
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
            /*============================================DRIVING_FORWARD_STATE END=======*/


            /*====BACKING_UP_STATE========================================================*/
        case BACKING_UP: // the front bumpers were hit so we gotta reverse
            switch (ThisEvent.EventType) { //switch statement that has all the possible cases that ThisEvent can be (only code the event caseS needed for this state, ignore rest)

                case ES_ENTRY: //first thing we want to do when we enter this state is to reverse only if front bumpers were hit

                    //if (bumperValue == FRONT_LEFT_BUMPER || bumperValue == FRONT_RIGHT_BUMPER || bumperValue == (FRONT_LEFT_BUMPER || FRONT_RIGHT_BUMPER)) {
                    if (bumperValue < 4) { //this is a better way of writing the line above, but i'm leaving that there so u know what this means, the line above doesn't work properly unfortunately
                        Roach_Reverse(ROACH_MAX_SPEED); //drive opposite direction only if front bumpers were hit
                    }
                    //start timer for 1/2s (we only want to back up for half a second))
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME); //reset timer
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

                case DARK: // ayy we ended up in the dark while reversing, so switch to hiding state so we can stop moving
                    nextState = HIDING;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

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
                        } else if (lightLevel < LIGHT_ON_THRESHOLD) {
                            nextState = DRIVING_FORWARD;
                            makeTransition = TRUE;
                        }
                    }
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

                default: //ignore all other events
                    break;
            }
            break;
            /*============================================BACKING_UP_STATE_END============*/


            /*====EVADE_FORWARD_STATE=====================================================*/
        case EVADE_FORWARD: // the rear bumpers were hit so we gotta move forward instead
            switch (ThisEvent.EventType) { //switch statement that has all the possible cases that ThisEvent can be (only code the event caseS needed for this state, ignore rest)

                case ES_ENTRY: //first thing we want to do when we enter this state is to reverse only if front bumpers were hit

                    //if (bumperValue == REAR_LEFT_BUMPER || bumperValue == REAR_RIGHT_BUMPER || bumperValue == (REAR_LEFT_BUMPER || REAR_RIGHT_BUMPER)) {
                    if (bumperValue > 3) { //better way of writing the line above, leaving it there for clarity but line above doesn't actually work
                        Roach_DriveForward(ROACH_MAX_SPEED); //drive opposite direction only if front bumpers were hit
                    }

                    //start timer for 1/2s (we only want to move forward for half a second))
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME); //reset timer
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

                case DARK: // ayy we ended up in the dark while moving, so switch to hiding state so we can stop moving
                    nextState = HIDING;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

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
                        } else if (lightLevel < LIGHT_ON_THRESHOLD) {
                            nextState = DRIVING_FORWARD;
                            makeTransition = TRUE;
                        }
                    }
                    ThisEvent.EventType = ES_NO_EVENT; //always send ES_NO_EVENT once ur done handling the current event
                    break;

                default: //ignore all other events
                    break;
            }
            break;
            /*=========================================EVADE_FORWARD_STATE_END============*/


            /*====HIDING_STATE============================================================*/
        case HIDING: // we r in zi dark, roach no more move
            switch (ThisEvent.EventType) { // THIS SWITCH CASE IS FOR EVENTS
                case ES_ENTRY: //when we enter this state, drive, and send ES_NO_EVENT after                    
                    Roach_Stop(); // Starts motors
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case LIGHT: // we found a somewhere to hide! transition to hiding state so we can stop the motors
                    nextState = DRIVING_FORWARD;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                default: //ignore all other events
                    break;
            }
            break;
            /*================================================HIDING_STATE_END============*/


        default: // all unhandled states fall into here
            break;
    } // end switch on Current State


    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunTemplateFSM(EXIT_EVENT);
        CurrentState = nextState;
        RunTemplateFSM(ENTRY_EVENT);
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