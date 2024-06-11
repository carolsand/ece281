/*
 * File: Robot_HSM.c
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

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "Robot_HSM.h"
#include "Robot.h"
#include "FinalEventChecker.h"
#include "FindTowerSubHSM.h" //#include all sub state machines called
#include <stdio.h>
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
//Include any defines you need to do
#define DRIVE_TIME 1000

#define BACKING_UP_SPEED 70
#define BACKING_UP_TIME 400
#define TURNING_TIME 250

#define SCOOP_PERIOD_TIME 5000
#define TIME_PAUSED 1000

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/


typedef enum {
    InitPState,
    DRIVING_FORWARD,
    HIDING,
    BACKING_UP,
    BoundDetected,
    EVADE_FORWARD,
} Robot_HSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"DRIVING_FORWARD",
	"HIDING",
	"BACKING_UP",
	"BoundDetected",
	"EVADE_FORWARD",
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

static Robot_HSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
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
uint8_t InitRobot_HSM(uint8_t Priority) {
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
 * @Function PostRobot_HSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostRobot_HSM(ES_Event ThisEvent) {
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
ES_Event RunRobot_HSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    Robot_HSMState_t nextState; // <- change type to correct enum
    static uint8_t bumperStatus = 0;
    static uint8_t tapeSensorStatus = 0;
    static Robot_HSMState_t prevState4tape = DRIVING_FORWARD;
    static Robot_HSMState_t prevState4bump = DRIVING_FORWARD;
    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Initialize all sub-state machines
                //InitFindTowerSubHSM();
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
                    Robot_LeftMtrSpeed(80);
                    Robot_RightMtrSpeed(80);
                    ES_Timer_InitTimer(SCOOP_TIMER, SCOOP_PERIOD_TIME); ///initialize timer, every 10 seconds the scoop deposits 
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case BUMP: // when the bumper(s) gets pushed 
                    prevState4bump = DRIVING_FORWARD;
                    nextState = BACKING_UP; // PUSHED event will cause state machine to transition to BACKING_UP state (.. cause we need to back up)
                    makeTransition = TRUE;
                    bumperStatus = ThisEvent.EventParam; // save the bumpers that were triggered
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;

                case FOUND_TAPE: // when the tape sensor(s)(s) get activated
                    prevState4tape = DRIVING_FORWARD;
                    nextState = BACKING_UP;
                    makeTransition = TRUE;
                    tapeSensorStatus = ThisEvent.EventParam; // save the tape sensors that were triggered
                    ThisEvent.EventType = ES_NO_EVENT; // (should always b done once we are done doing what we wanna do w current event)
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SCOOP_TIMER) {
                        Robot_LeftMtrSpeed(0);
                        Robot_RightMtrSpeed(0);
                        Robot_DepositBalls();
                        ES_Timer_InitTimer(PAUSE_TIMER, TIME_PAUSED); //wait a little bit before resetting
                    }
                    if (ThisEvent.EventParam == PAUSE_TIMER) {
                        Robot_ResetScoop();
                        Robot_LeftMtrSpeed(80);
                        Robot_RightMtrSpeed(80);
                        ES_Timer_InitTimer(SCOOP_TIMER, SCOOP_PERIOD_TIME);
                    }
                default: //ignore all other events
                    break;
            }
            break;
            /*============================================DRIVING_FORWARD_STATE END=======*/


            /*====BACKING_UP_STATE========================================================*/
        case BACKING_UP: // the front bumpers were hit so we gotta reverse
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
                    break;
                case ES_ENTRY:
                    // if we get bumped, then we first go backwards
                    switch (bumperStatus) {
                        case FrontLeft:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case FrontRight:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case RearLeft:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                        case RearRight:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                    }
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME);
                    break;


                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BACKING_UP_TIMER) {
                        // we have finished backing up, and now we want to turn a lil bit
                        Robot_LeftMtrSpeed(0);
                        Robot_RightMtrSpeed(65);
                        ES_Timer_InitTimer(TURNING_TIMER, TURNING_TIME); //reset timer
                    }
                    if (ThisEvent.EventParam == TURNING_TIMER) {
                        //we have finished turning, now we go back prev state
                        nextState = DRIVING_FORWARD;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    if (ThisEvent.EventParam == SCOOP_TIMER) {
                        Robot_LeftMtrSpeed(0);
                        Robot_RightMtrSpeed(0);
                        Robot_DepositBalls();
                        ES_Timer_InitTimer(PAUSE_TIMER, TIME_PAUSED); //wait a little bit before resetting
                    }
                    if (ThisEvent.EventParam == PAUSE_TIMER) {
                        Robot_ResetScoop();
                        ES_Timer_InitTimer(SCOOP_TIMER, SCOOP_PERIOD_TIME);
                    }
                    break;
                case BUMP:
                    // if we get bumped, then we first go backwards
                    switch (ThisEvent.EventParam) {
                        case FrontLeft:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case FrontRight:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case RearLeft:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                        case RearRight:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                    }
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME);
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case FOUND_TAPE:
                    //   printf("Tape found\r\n");
                    tapeSensorStatus = ThisEvent.EventParam;
                    prevState4tape = BACKING_UP;
                    // transition to BoundDetected
                    nextState = BoundDetected;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                default:
                    break;
            }

            break;
            /*============================================BACKING_UP_STATE_END============*/
        case BoundDetected: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            //  ThisEvent = RunBoundDetectedSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
                    break;
                case ES_ENTRY:
                    //if (prevState4tape == BACKING_UP) {
                    // if we get bumped, then we first go backwards
                    switch (tapeSensorStatus) {
                        case FrontLeft:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case FrontRight:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case RearLeft:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                        case RearRight:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                    }
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME);
                    // }
                    //                    else {
                    //                        //we detected the tape but we are choosing to ignore it
                    //                        //go back to locate correct hole state.
                    //                        nextState = LocateCorrectHole;
                    //                        makeTransition = TRUE;
                    //                    }
                    //ThisEvent.EventType = ES_NO_EVENT;
                    break;
                case FOUND_TAPE:
                    switch (ThisEvent.EventParam) {
                        case FrontLeft:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case FrontRight:
                            Robot_LeftMtrSpeed(-BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(-BACKING_UP_SPEED);
                            break;
                        case RearLeft:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                        case RearRight:
                            Robot_LeftMtrSpeed(BACKING_UP_SPEED);
                            Robot_RightMtrSpeed(BACKING_UP_SPEED);
                            break;
                    }
                    ES_Timer_InitTimer(BACKING_UP_TIMER, BACKING_UP_TIME);
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BACKING_UP_TIMER) {
                        // we have finished backing up, and now we want to turn a lil bit
                        Robot_LeftMtrSpeed(0);
                        Robot_RightMtrSpeed(65);
                        ES_Timer_InitTimer(TURNING_TIMER, TURNING_TIME); //reset timer
                    } else if (ThisEvent.EventParam == TURNING_TIMER) {
                        //we have finished turning, now we go back to our previous state
                        nextState = DRIVING_FORWARD;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    if (ThisEvent.EventParam == SCOOP_TIMER) {
                        Robot_LeftMtrSpeed(0);
                        Robot_RightMtrSpeed(0);
                        Robot_DepositBalls();
                        ES_Timer_InitTimer(PAUSE_TIMER, TIME_PAUSED); //wait a little bit before resetting
                    }
                    if (ThisEvent.EventParam == PAUSE_TIMER) {
                        Robot_ResetScoop();
                        ES_Timer_InitTimer(SCOOP_TIMER, SCOOP_PERIOD_TIME);
                    }
                    break;
                case BUMP:
                    // transition to BumpDetected
                    bumperStatus = ThisEvent.EventParam;
                    nextState = BACKING_UP;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                default:
                    break;
            }
            break;
    }

    // end switch on Current State


    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunRobot_HSM(EXIT_EVENT);
        CurrentState = nextState;
        RunRobot_HSM(ENTRY_EVENT);
    }
    ES_Tail(); // trace call stack end
    return ThisEvent;

}



/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
