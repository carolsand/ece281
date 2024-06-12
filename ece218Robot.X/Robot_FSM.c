
/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"

#include <BOARD.h>
//Uncomment these for the Roaches
#include "Robot.h"
#include "ES_CheckEvents.h"
#include <stdio.h>


/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
// number to scale the Mtr speeds |x| < 1
#define LEFTSCALE -1
#define RIGHTSCALE -1
#define RUN 100
#define WALK 75
#define FSMDELAY 500
#define LIGHT 1
/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine.*/
void Rest(void){
    Robot_LeftMtrSpeed(0);
    Robot_RightMtrSpeed(0);
}
void RunS(void){
    Robot_LeftMtrSpeed(LEFTSCALE * RUN);
    Robot_RightMtrSpeed(RIGHTSCALE * RUN);
}
void WalkS(void){
    Robot_LeftMtrSpeed(LEFTSCALE * WALK);
    Robot_RightMtrSpeed(RIGHTSCALE * WALK);
}
void BackUP(void){
    Robot_LeftMtrSpeed(LEFTSCALE * -WALK);
    Robot_RightMtrSpeed(RIGHTSCALE * -WALK);
}
void TurnR(void){
    Robot_LeftMtrSpeed(LEFTSCALE * RUN);
    Robot_RightMtrSpeed(RIGHTSCALE * RUN);
}

void TurnL(void){
    Robot_LeftMtrSpeed(LEFTSCALE * -RUN);
    Robot_RightMtrSpeed(RIGHTSCALE * RUN);
}
/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
ES_Event BumpersHit;
ES_Event FoundTape;
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

typedef enum {
    Start,
    Found_Tape,
    Running,
    Backup,
    Turning,
    Follow_Tape,
    Follow_Wall,
    Forward,
} TemplateFSMState_t;

static const char *StateNames[] = {
	"Start",
	"Found_tape",
	"Backup",
	"Follow_Tape",
	"Follow_Wall",
	"Forward",
};

TemplateFSMState_t Start = Running;
static TemplateFSMState_t CurrentState = Running; // <- change enum name to match ENUM
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
uint8_t InitRobotFSM(uint8_t Priority)
{
    MyPriority = Priority;
     ES_Timer_Init();
    // put us into the Initial PseudoState
    CurrentState = Hiding;
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
uint8_t PostRobotFSM(ES_Event ThisEvent)
{
    if (ThisEvent.EventType == BUMPER){
        BumpersHit = ThisEvent;
    }
    if(ThisEvent.EventType == FoundTape){
        PaceWall = ThisEvent;
    }
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
ES_Event RunRobotFSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    TemplateFSMState_t nextState; // <- need to change enum type here
    ES_Tattle(); // trace call stack
    switch (CurrentState) {
        case Start: // If current state is initial Psedudo State
            switch(ThisEvent.EventType){
                case ES_ENTRY:
                    Rest();
                    //ThisEvent = NO_EVENT;
                    break;
                case BUMPER:
                    nextState = Creep;
                    makeTransition = TRUE;
                    ThisEvent = NO_EVENT;
                    break;
                case LIGHTLEVEL:
                    if(ThisEvent.EventParam == LIGHT){
                        nextState = Running;
                        makeTransition = TRUE;
                        ThisEvent = NO_EVENT;
                    }
                    break;
            }
            break;
        case Running:
                switch(ThisEvent.EventType){
                case ES_ENTRY:
                    RunS();
                    //ThisEvent = NO_EVENT;
                    break;
                case BUMPER:
                    nextState = Backup;
                    makeTransition = TRUE;
                    ThisEvent = NO_EVENT;
                    break;
                case FOUND_TAPE:
                    if(ThisEvent.EventParam == DARK){
                        nextState = Follow_Tape;
                        makeTransition = TRUE;
                        ThisEvent = NO_EVENT;
                    }
                    break;
            }
            break;
        case Backup:
            Lchange = Turning;
            switch(ThisEvent.EventType){
                case ES_ENTRY:
                    ES_Timer_InitTimer(FSMTime,FSMDELAY);
                    BackUP();
                    //ThisEvent = NO_EVENT;
                    break;
                case BUMPER:
                    //BumpersHit = ThisEvent.EventParam;
                    //TurnR();
                    break;
                case LIGHTLEVEL:
                    if(LightChange.EventParam == DARK){
                        Lchange = Hiding;
                    }
                    else{
                        Lchange = Turning;
                    }
                    break;
                case ES_TIMEOUT:
                    nextState = Lchange;
                    makeTransition = TRUE;
                    ThisEvent = NO_EVENT;
                    break;
            } 
            break;
        case Turning:
            Lchange = Running;
            switch(ThisEvent.EventType){
                case ES_ENTRY:
                    ES_Timer_InitTimer(FSMTime,FSMDELAY);
                    // always left will check VS BumpersHit later
                    TurnL();
                    //ThisEvent = NO_EVENT;
                    break;
                case BUMPER:
                    //Change Dir
                    TurnR();
                    break;
                case LIGHTLEVEL:
                    if(LightChange.EventParam == DARK){
                        Lchange = Hiding;
                    }
                    else{
                        Lchange = Running;
                    }
                    break;
                case ES_TIMEOUT:
                    nextState = Lchange;
                    makeTransition = TRUE;
                    ThisEvent = NO_EVENT;
                    break;
            } 
            break;
        case Creep:
            Lchange = Hiding;
            switch(ThisEvent.EventType){
                case ES_ENTRY:
                    ES_Timer_InitTimer(FSMTime,FSMDELAY);
                    
                    // always left will check VS BumpersHit later
                    
                    if(BumpersHit.EventParam>3){
                        WalkS();
                    }
                    else{
                        BackUP();
                    }
                    //ThisEvent = NO_EVENT;
                    break;
                case BUMPER:
                    if(BumpersHit.EventParam != 0){
                        if(BumpersHit.EventParam>3){
                            WalkS();
                        }
                        else{
                            BackUP();
                        }
                    }
                    break;
                case LIGHTLEVEL:
                    if(ThisEvent.EventParam == DARK){
                        Lchange = Hiding;
                    }
                    else{
                        Lchange = Running;
                    }
                    break;
                case ES_TIMEOUT:
                    nextState = Lchange;
                    makeTransition = TRUE;
                    ThisEvent = NO_EVENT;
                    break;
            } 
            break;   
        default:
            printf("\r\n NOT YET DONE OR ERROR");
            CurrentState = Hiding;
            makeTransition == TRUE;
    }
    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunRobotFSM(EXIT_EVENT);
        CurrentState = nextState;
        RunRobotFSM(ENTRY_EVENT);
    }
    ES_Tail(); // trace call stack end
    return ThisEvent;   
    }
    



/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

