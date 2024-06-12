/*
 * File:   dynamicduo.c
 * Author: cas-l
 *
 * Created on May 22, 2024, 10:08 PM
 */

#include <Robot.h>
#include <BOARD.h>
#include <xc.h>
#include <stdio.h>
#include "RC_Servo.h"
#include <pwm.h>
#include <serial.h>
#include <AD.h>
#include "IO_Ports.h"
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/

#define OUTPUT 0
#define INPUT  1

#define LOW    0
#define HIGH   1

/* PINS FOR THE MOTORS */
#define LEFT_DIR                PORTY09_LAT
#define LEFT_DIR_INV            PORTZ09_LAT
#define RIGHT_DIR               PORTY08_LAT
#define RIGHT_DIR_INV           PORTY10_LAT

#define LEFT_DIR_TRIS           PORTY09_TRIS
#define LEFT_DIR_INV_TRIS       PORTZ09_TRIS
#define RIGHT_DIR_TRIS          PORTY08_TRIS
#define RIGHT_DIR_INV_TRIS      PORTY10_TRIS

#define LEFT_PWM                PWM_PORTZ06
#define RIGHT_PWM               PWM_PORTY12

/* PINS FOR THE BUMPERS (AKA LIMIT SWITCHES) */
#define BUMP_FRONT_LEFT         PORTZ03_BIT
#define BUMP_FRONT_RIGHT        PORTZ04_BIT
#define BUMP_REAR_RIGHT         PORTZ05_BIT
#define BUMP_REAR_LEFT          PORTZ07_BIT

#define BUMP_FRONT_LEFT_TRIS    PORTZ03_TRIS
#define BUMP_FRONT_RIGHT_TRIS   PORTZ04_TRIS
#define BUMP_REAR_RIGHT_TRIS    PORTZ05_TRIS
#define BUMP_REAR_LEFT_TRIS     PORTZ07_TRIS

/* PINS FOR SERVOS */
#define DOOR_SERVO              RC_PORTX03
#define SCOOP_SERVO             RC_PORTX04

/* PINS FOR DETECTORS */
#define BEACON_DETECTOR         PORTZ08_BIT
#define TRACK_WIRE_DETECTOR     AD_PORTV8

#define BEACON_DETECTOR_TRIS    PORTZ08_TRIS
//#define TRACK_WIRE_DETECT_TRIS  PORTY07_BIT

/* PINS FOR TAPE SENSORS */
#define TAPE_SENSOR_FRONT_LEFT  AD_PORTV3
#define TAPE_SENSOR_FRONT_RIGHT AD_PORTV4
#define TAPE_SENSOR_REAR_RIGHT  AD_PORTV5
#define TAPE_SENSOR_REAR_LEFT   AD_PORTV6

#define LIGHT_SENSOR 100 // ???
#define ROBOT_BAT_VOLTAGE BAT_VOLTAGE


//light bar defines
#define NUMLEDS 12

#define LED_SetPinOutput(i) *LED_TRISCLR[i] = LED_bitsMap[i]
#define LED_SetPinInput(i) *LED_TRISSET[i] = LED_bitsMap[i];
#define LED_On(i) *LED_LATCLR[(unsigned int)i] = LED_bitsMap[(unsigned int)i];
#define LED_Off(i) *LED_LATSET[(unsigned int)i] = LED_bitsMap[(unsigned int)i];
#define LED_Get(i) (*LED_LAT[(unsigned int)i]&LED_bitsMap[(unsigned int)i])

#define TAPE_SENSOR_THRESHOLD 750
#define TRACKWIRE_THRESHOLD 700


/*******************************************************************************
 * PRIVATE VARIABLES                                                           *
 ******************************************************************************/

static char trackwireStatus = TRACKWIRE_NOT_PRESENT;
static char FL_tapeSensorStatus = TAPE_NOT_PRESENT; //front left tape sensor
static char FR_tapeSensorStatus = TAPE_NOT_PRESENT; //front right tape sensor
static char RL_tapeSensorStatus = TAPE_NOT_PRESENT; //rear left tape sensor
static char RR_tapeSensorStatus = TAPE_NOT_PRESENT; //rear right tape sensor

typedef union {

    struct {
        unsigned bit0 : 1;
        unsigned bit1 : 1;
        unsigned bit2 : 1;
        unsigned bit3 : 1;
        unsigned bit4 : 1;
        unsigned bit5 : 1;
        unsigned bit6 : 1;
        unsigned bit7 : 1;
        unsigned bit8 : 1;
        unsigned bit9 : 1;
        unsigned bit10 : 1;
        unsigned bit11 : 1;
        unsigned : 4;
    };
    uint16_t c;
} LEDBank_t;


static volatile unsigned int * const LED_TRISCLR[] = {&TRISECLR, &TRISDCLR, &TRISDCLR, &TRISDCLR,
    &TRISDCLR, &TRISDCLR, &TRISDCLR, &TRISFCLR, &TRISFCLR, &TRISGCLR, &TRISFCLR, &TRISFCLR};

static volatile unsigned int * const LED_TRISSET[] = {&TRISESET, &TRISDSET, &TRISDSET, &TRISDSET,
    &TRISDSET, &TRISDSET, &TRISDSET, &TRISFSET, &TRISFSET, &TRISGSET, &TRISFSET, &TRISFSET};

static volatile unsigned int * const LED_LATCLR[] = {&LATECLR, &LATDCLR, &LATDCLR, &LATDCLR,
    &LATDCLR, &LATDCLR, &LATDCLR, &LATFCLR, &LATFCLR, &LATGCLR, &LATFCLR, &LATFCLR};

static volatile unsigned int * const LED_LATSET[] = {&LATESET, &LATDSET, &LATDSET, &LATDSET,
    &LATDSET, &LATDSET, &LATDSET, &LATFSET, &LATFSET, &LATGSET, &LATFSET, &LATFSET};

static volatile unsigned int * const LED_LAT[] = {&LATE, &LATD, &LATD, &LATD,
    &LATD, &LATD, &LATD, &LATF, &LATF, &LATG, &LATF, &LATF};

static unsigned short int LED_bitsMap[] = {BIT_7, BIT_5, BIT_10, BIT_11, BIT_3, BIT_6, BIT_7, BIT_6, BIT_4, BIT_6, BIT_5, BIT_1};

//static unsigned short int LED_ShiftAmount[] = {7, 5, 10, 11, 3, 6, 7, 6, 4, 6, 5, 1};


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                           *
 ******************************************************************************/

/**
 * @Function Robot_Init(void)
 * @param None.
 * @return None.
 * @brief  Performs all the initialization necessary for the roach. this includes initializing 
 * the PWM module, the A/D converter, the data directions on some pins, and 
 * setting the initial motor directions.
 * @note  None.
 * @author Max Dunne, 2012.01.06 */
void Robot_Init(void) {
    // set up beacon detector and track wire detector as inputs 
    BEACON_DETECTOR_TRIS = INPUT;

    // also set up bumpers (limit switches) as inputs
    BUMP_FRONT_LEFT_TRIS = INPUT;
    BUMP_FRONT_RIGHT_TRIS = INPUT;
    BUMP_REAR_LEFT_TRIS = INPUT;
    BUMP_REAR_RIGHT_TRIS = INPUT;

    //set the control pins for the motors
    PWM_Init();
    PWM_SetFrequency(1000);
    PWM_AddPins(LEFT_PWM | RIGHT_PWM);

    LEFT_DIR_TRIS = OUTPUT;
    LEFT_DIR_INV_TRIS = OUTPUT;
    RIGHT_DIR_TRIS = OUTPUT;
    RIGHT_DIR_INV_TRIS = OUTPUT;

    LEFT_DIR = LOW;
    LEFT_DIR_INV = HIGH;
    RIGHT_DIR = LOW;
    RIGHT_DIR_INV = HIGH;


    // set up servos
    RC_Init();
    RC_AddPins(DOOR_SERVO | SCOOP_SERVO);


    RC_SetPulseTime(DOOR_SERVO, 1950);
    RC_SetPulseTime(SCOOP_SERVO, 1120);

    // set up tape sensors 

    AD_Init();
    AD_AddPins(TAPE_SENSOR_FRONT_LEFT | TAPE_SENSOR_FRONT_RIGHT
            | TAPE_SENSOR_REAR_LEFT | TAPE_SENSOR_REAR_RIGHT | TRACK_WIRE_DETECTOR);


}

/**
 * @Function Robot_LeftMtrSpeed(char newSpeed)
 * @param newSpeed - A value between -100 and 100 which is the new speed
 * @param of the motor. 0 stops the motor. A negative value is reverse.
 * @return SUCCESS or ERROR
 * @brief  This function is used to set the speed and direction of the left motor.
 * @author Max Dunne, 2012.01.06 */
char Robot_LeftMtrSpeed(char newSpeed) {
    if ((newSpeed < -ROBOT_MAX_SPEED) || (newSpeed > ROBOT_MAX_SPEED)) {
        return (ERROR);
    }
    newSpeed = -newSpeed;

    if (newSpeed < 0) {
        LEFT_DIR = 0;
        newSpeed = newSpeed * (-1); // set speed to a positive value
    } else {
        LEFT_DIR = 1;
    }
    LEFT_DIR_INV = ~(LEFT_DIR);
    if (PWM_SetDutyCycle(LEFT_PWM, newSpeed * (MAX_PWM / ROBOT_MAX_SPEED)) == ERROR) {
        //printf("ERROR: setting channel 1 speed!\n");
        return (ERROR);
    }
    return (SUCCESS);
}

/**
 * @Function Robot_RightMtrSpeed(char newSpeed)
 * @param newSpeed - A value between -100 and 100 which is the new speed
 * @param of the motor. 0 stops the motor. A negative value is reverse.
 * @return SUCCESS or ERROR
 * @brief  This function is used to set the speed and direction of the left motor.
 * @author Max Dunne, 2012.01.06 */
char Robot_RightMtrSpeed(char newSpeed) {
    if ((newSpeed < -ROBOT_MAX_SPEED) || (newSpeed > ROBOT_MAX_SPEED)) {
        return (ERROR);
    }
    if (newSpeed < 0) {
        RIGHT_DIR = 0;
        newSpeed = newSpeed * (-1); // set speed to a positive value
    } else {
        RIGHT_DIR = 1;
    }
    RIGHT_DIR_INV = ~(RIGHT_DIR);
    if (PWM_SetDutyCycle(RIGHT_PWM, newSpeed * (MAX_PWM / ROBOT_MAX_SPEED)) == ERROR) {
        //puts("\aERROR: setting channel 1 speed!\n");
        return (ERROR);
    }
    return (SUCCESS);
}

/**
 * @Function Robot_BatteryVoltage(void)
 * @param None.
 * @return a 10-bit value corresponding to the current voltage of the roach
 * @brief  returns a 10:1 scaled value of the roach battery level
 * @author Max Dunne, 2013.07.12 */
unsigned int Robot_BatteryVoltage(void) {
    return AD_ReadADPin(ROBOT_BAT_VOLTAGE);
}

/**
 * @Function Robot_ReadFrontLeftBumper(void)
 * @param None.
 * @return BUMPER_TRIPPED or BUMPER_NOT_TRIPPED
 * @brief  Returns the state of the front left bumper
 * @author Max Dunne, 2012.01.06 */
unsigned char Robot_ReadFrontLeftBumper(void) {
    return !BUMP_FRONT_LEFT;
}

/**
 * @Function Robot_ReadFrontRightBumper(void)
 * @param None.
 * @return BUMPER_TRIPPED or BUMPER_NOT_TRIPPED
 * @brief  Returns the state of the front right bumper
 * @author Max Dunne, 2012.01.06 */
unsigned char Robot_ReadFrontRightBumper(void) {
    return !BUMP_FRONT_RIGHT;
}

/**
 * @Function Robot_ReadRearLeftBumper(void)
 * @param None.
 * @return BUMPER_TRIPPED or BUMPER_NOT_TRIPPED
 * @brief  Returns the state of the rear left bumper
 * @author Max Dunne, 2012.01.06 */
unsigned char Robot_ReadRearLeftBumper(void) {
    return !BUMP_REAR_LEFT;
}

/**
 * @Function Robot_ReadRearRightBumper(void)
 * @param None.
 * @return BUMPER_TRIPPED or BUMPER_NOT_TRIPPED
 * @brief  Returns the state of the rear right bumper
 * @author Max Dunne, 2012.01.06 */
unsigned char Robot_ReadRearRightBumper(void) {
    return !BUMP_REAR_RIGHT;
}

/**
 * @Function Robot_ReadBumpers(void)
 * @param None.
 * @return 4-bit value representing all four bumpers in following order: front left,front right, rear left, rear right
 * @brief  Returns the state of all 4 bumpers
 * @author Max Dunne, 2012.01.06 */
unsigned char Robot_ReadBumpers(void) {
    //unsigned char bump_state;
    //bump_state = (!BUMP_FRONT_LEFT + ((!BUMP_FRONT_RIGHT) << 1)+((!BUMP_REAR_LEFT) << 2)+((!BUMP_REAR_RIGHT) << 3));
    return (!BUMP_FRONT_LEFT + ((!BUMP_FRONT_RIGHT) << 1)+((!BUMP_REAR_LEFT) << 2)+((!BUMP_REAR_RIGHT) << 3));
}

/**
 * @Function Robot_LEDSSet( unsigned char pattern)
 * @param pattern - sets LEDs on (1) or off (0) as in the pattern.
 * @return SUCCESS or ERROR
 * @brief  Forces the LEDs in (bank) to on (1) or off (0) to match the pattern.
 * @author Gabriel Hugh Elkaim, 2011.12.25 01:16 Max Dunne 2015.09.18 */
char Robot_LEDSSet(uint16_t pattern) {
    char i;
    for (i = 0; i < NUMLEDS; i++) {
        if (pattern & (1 << i)) {
            LED_On(i);
        } else {
            LED_Off(i);
        }
    }
    return SUCCESS;
}

/**
 * @Function Robot_LEDSGet(void)
 * @return uint16_t: ERROR or state of BANK
 * @author Max Dunne, 203.10.21 01:16 2015.09.18 */
uint16_t Robot_LEDSGet(void) {
    uint16_t LEDStatus = 0;
    int8_t i;
    for (i = (NUMLEDS - 1); i >= 0; i--) {
        LEDStatus |= !LED_Get(i);
        LEDStatus <<= 1;
        //        printf("%d\t",i);
    }
    LEDStatus >>= 1;
    return LEDStatus;
    return 0;
}

/**
 * @Function Robot_BarGraph(uint8_t Number)
 * @param Number - value to light between 0 and 12 leds
 * @return SUCCESS or ERROR
 * @brief  allows all leds to be used as a bar graph
 * @author  Max Dunne 2015.09.18 */


char Robot_BarGraph(uint8_t Number) {
    if (Number > NUMLEDS) {
        return ERROR;
    }
    uint16_t Pattern = 0;
    uint8_t iterations;

    for (iterations = 0; iterations < Number; iterations++) {
        Pattern <<= 1;
        Pattern |= 1;
    }
    Robot_LEDSSet(Pattern);
    return SUCCESS;
}

unsigned char Robot_ReadFrontLeftTape(void) {
    int tapeSensorValue = 0;

    if (AD_IsNewDataReady) {
        tapeSensorValue = AD_ReadADPin(TAPE_SENSOR_FRONT_LEFT);
        if (tapeSensorValue < TAPE_SENSOR_THRESHOLD) {
            FL_tapeSensorStatus = TAPE_PRESENT;
            return TAPE_PRESENT;
        } else {
            FL_tapeSensorStatus = TAPE_NOT_PRESENT;
            return TAPE_NOT_PRESENT;
        }
    } else {
        return FL_tapeSensorStatus;
    }
}

unsigned char Robot_ReadFrontRightTape(void) {
    int tapeSensorValue = 0;

    if (AD_IsNewDataReady) {
        tapeSensorValue = AD_ReadADPin(TAPE_SENSOR_FRONT_RIGHT);
        if (tapeSensorValue < TAPE_SENSOR_THRESHOLD) {
            FR_tapeSensorStatus = TAPE_PRESENT;
            return TAPE_PRESENT;
        } else {
            FR_tapeSensorStatus = TAPE_NOT_PRESENT;
            return TAPE_NOT_PRESENT;
        }
    } else {
        return FR_tapeSensorStatus;
    }
}

unsigned char Robot_ReadRearLeftTape(void) {
    int tapeSensorValue = 0;

    if (AD_IsNewDataReady) {
        tapeSensorValue = AD_ReadADPin(TAPE_SENSOR_REAR_LEFT);
        if (tapeSensorValue < TAPE_SENSOR_THRESHOLD) {
            RL_tapeSensorStatus = TAPE_PRESENT;
            return TAPE_PRESENT;
        } else {
            RL_tapeSensorStatus = TAPE_NOT_PRESENT;
            return TAPE_NOT_PRESENT;
        }
    } else {
        return RL_tapeSensorStatus;
    }
}

unsigned char Robot_ReadRearRightTape(void) {
    int tapeSensorValue = 0;

    if (AD_IsNewDataReady) {
        tapeSensorValue = AD_ReadADPin(TAPE_SENSOR_REAR_RIGHT);
        if (tapeSensorValue < TAPE_SENSOR_THRESHOLD) {
            RR_tapeSensorStatus = TAPE_PRESENT;
            return TAPE_PRESENT;
        } else {
            RR_tapeSensorStatus = TAPE_NOT_PRESENT;
            return TAPE_NOT_PRESENT;
        }
    } else {
        return RR_tapeSensorStatus;
    }
}

unsigned char Robot_IsTrackwirePresent(void){
    int trackwireValue = 0;

    if (AD_IsNewDataReady) {
        trackwireValue = AD_ReadADPin(TRACK_WIRE_DETECTOR);
        if (trackwireValue < TRACKWIRE_THRESHOLD) {
            trackwireStatus = TRACKWIRE_NOT_PRESENT;
            return TRACKWIRE_NOT_PRESENT;
        } else {
            trackwireStatus = TRACKWIRE_PRESENT;
            return TRACKWIRE_PRESENT;
        }
    } else {
        return trackwireStatus;
    }
}

/**
 * @Function Robot_SetScoopServo(int position)
 * @param position (500 - 2500)
 * @return SUCCESS or ERROR
 * @brief This function is used to set the position of the servo 
 * @author
 */
unsigned char Robot_SetScoopServo(int newPosition) {
    if (newPosition > 2500 || newPosition < 500) {
        return (ERROR);
    }
    RC_SetPulseTime(SCOOP_SERVO, newPosition);
    return (SUCCESS);

}

/**
 * @Function Robot_SetDoorServo(int position)
 * @param position (1000-2000)
 * @return SUCCESS or ERROR
 * @brief This function is used to set the position of the servo
 * @author
 */
unsigned char Robot_SetDoorServo(int newPosition) {
    if (newPosition > 2000 || newPosition < 1000) {
        return (ERROR);
    }
    RC_SetPulseTime(DOOR_SERVO, newPosition);
    return (SUCCESS);
}

unsigned char Robot_UnloadScoop(void){
    RC_SetPulseTime(SCOOP_SERVO, 2450);
    return (SUCCESS);
}
unsigned char Robot_ResetScoop(void){
    RC_SetPulseTime(SCOOP_SERVO, 1120);
    return (SUCCESS);
}


#ifdef ROBOT_TEST

void main(void) {
    BOARD_Init();
    SERIAL_Init();
    Robot_Init();
    static char i = 0;
    static unsigned int servoPulse = 1200;
    static unsigned int doorPulse = 1500;
    static unsigned char tapeStatus = TAPE_NOT_PRESENT;

    printf("welcome to ece218 robot test harness \r\nenter a key to perform a test.\r\n\r\n");
    printf("w: print trackwire raw value\r\n");
    printf("t: tests all the tape sensors, reads them and prints out the response and its raw value \r\n");
    printf("u: moves the scoop servo up\r\nd: moves the scoop servo down\r\n");
    printf("l: moves the door servo inwards\r\nr: moves the door servo outwards\r\n\r\n");
    printf("press the bumpers to run the motors. \r\nfront right bumper = right motor max forward speed \r\n");
    printf("front left bumper = left motor max forward speed \r\nrear right bumper = max reverse speed for both\r\n");
    printf("rear left bumper = stop both motors\r\n\r\n");


    while (1) {
        //Robot_LeftMtrSpeed(100);
        //Robot_RightMtrSpeed(-100);
        if (Robot_ReadFrontLeftBumper() == BUMPER_TRIPPED) {
            Robot_LeftMtrSpeed(100);
        }
        if (Robot_ReadRearLeftBumper() == BUMPER_TRIPPED) {
            Robot_LeftMtrSpeed(0);
            Robot_RightMtrSpeed(0);
        }
        if (Robot_ReadFrontRightBumper() == BUMPER_TRIPPED) {
            Robot_RightMtrSpeed(100);
        }
        if (Robot_ReadRearRightBumper() == BUMPER_TRIPPED) {
            Robot_RightMtrSpeed(-100);
            Robot_LeftMtrSpeed(-100);
            
        }

        i = GetChar();
        if(i=='w'){
            printf("value: %d, trackwire value\r\n", AD_ReadADPin(TRACK_WIRE_DETECTOR));
        }
        if (i == 't') { //test tape sensors
            tapeStatus = Robot_ReadFrontLeftTape();
            if (tapeStatus == TAPE_PRESENT) {
                printf("value: %d, front left tape is present\r\n", AD_ReadADPin(TAPE_SENSOR_FRONT_LEFT));
            } else {
                printf("value: %d, front left tape is NOT present\r\n", AD_ReadADPin(TAPE_SENSOR_FRONT_LEFT));
            }

            tapeStatus = Robot_ReadFrontRightTape();
            if (tapeStatus == TAPE_PRESENT) {
                printf("value: %d, front right tape is present\r\n", AD_ReadADPin(TAPE_SENSOR_FRONT_RIGHT));
            } else {
                printf("value: %d, front right tape is NOT present\r\n", AD_ReadADPin(TAPE_SENSOR_FRONT_RIGHT));
            }

            tapeStatus = Robot_ReadRearLeftTape();
            if (tapeStatus == TAPE_PRESENT) {
                printf("value: %d, rear left tape is present\r\n", AD_ReadADPin(TAPE_SENSOR_REAR_LEFT));
            } else {
                printf("value: %d, rear left tape is NOT present\r\n", AD_ReadADPin(TAPE_SENSOR_REAR_LEFT));
            }

            tapeStatus = Robot_ReadRearRightTape();
            if (tapeStatus == TAPE_PRESENT) {
                printf("value: %d, rear right tape is present \r\n", AD_ReadADPin(TAPE_SENSOR_REAR_RIGHT));
            } else {
                printf("value: %d, rear right tape is NOT present \r\n", AD_ReadADPin(TAPE_SENSOR_REAR_RIGHT));
            }

        }
        if (i == 'u') {
            if (servoPulse < 2500) {
                servoPulse = servoPulse + 40;
                Robot_SetScoopServo(servoPulse);
            }
            printf("scoop servo value: %d \r\n\r\n", servoPulse);
        }

        if (i == 'd') {
            if (servoPulse > 500) {
                servoPulse = servoPulse - 40;
                Robot_SetScoopServo(servoPulse);
            }
            printf("scoop servo value: %d \r\n\r\n", servoPulse);
        }
        if (i == 'l') {
            if (doorPulse < 2000) {
                doorPulse = doorPulse + 50;
                Robot_SetDoorServo(doorPulse);
            }
            printf("door servo value: %d \r\n\r\n", doorPulse);
        }

        if (i == 'r') {
            if (doorPulse > 1000) {
                doorPulse = doorPulse - 50;
                Robot_SetDoorServo(doorPulse);
            }
            printf("door servo value: %d \r\n\r\n", doorPulse);
        }

    }


}


#endif

#ifdef ROACH_TEST
#pragma config FPLLIDIV 	= DIV_2		//PLL Input Divider
#pragma config FPLLMUL 		= MUL_20	//PLL Multiplier
#pragma config FPLLODIV 	= DIV_1 	//System PLL Output Clock Divid
#pragma config FNOSC 		= PRIPLL	//Oscillator Selection Bits
#pragma config FSOSCEN 		= OFF		//Secondary Oscillator Enable
#pragma config IESO 		= OFF		//Internal/External Switch O
#pragma config POSCMOD 		= XT		//Primary Oscillator Configuration
#pragma config OSCIOFNC 	= OFF		//CLKO Output Signal Active on the OSCO Pin
#pragma config FPBDIV 		= DIV_2		//Peripheral Clock Divisor
#pragma config FCKSM 		= CSECMD	//Clock Switching and Monitor Selection
#pragma config WDTPS 		= PS1		//Watchdog Timer Postscaler
#pragma config FWDTEN		= OFF		//Watchdog Timer Enable
#pragma config ICESEL		= ICS_PGx2	//ICE/ICD Comm Channel Select
#pragma config PWP 			= OFF		//Program Flash Write Protect
#pragma config BWP 			= OFF		//Boot Flash Write Protect bit
#pragma config CP 			= OFF		//Code Protect

#include <stdio.h>

//#define WANDER_MODE
#define WANDER_SAMPLE_RATE 100

#define FLEFT_BUMP_MASK (1)
#define FRIGHT_BUMP_MASK (1<<1)
#define RLEFT_BUMP_MASK (1<<2)
#define RRIGHT_BUMP_MASK (1<<3)

#define DELAY(x)    for (wait = 0; wait <= x; wait++) {asm("nop");}
#define A_BIT       18300
#define A_BIT_MORE  36600
#define YET_A_BIT_LONGER (A_BIT_MORE<<2)
#define A_LOT       183000
#define NUM_TIMES_REPEAT_LED 5
#define MOTOR_TIME (A_LOT<<2)

#define LOW_BAT 263
#define HIGH_BAT 310



#include <Robot.h>

void FlashLEDBar(uint8_t numtimes);

int main(void) {
    BOARD_Init();
    Robot_Init();

    unsigned int wait;
    unsigned int i, j;
    unsigned int scaledValue;
    int motorSpeed;
    printf("\r\nWelcome the the ECE118 Robot Test Harness");
    printf("\r\nThis code will allow someone to confirm operational hardware and software of a Robot");
    //  TEST THE LEDS
    for (i = 0; i < NUM_TIMES_REPEAT_LED; i++) {
        for (j = 0; j < NUMLEDS; j++) {
            Robot_LEDSSet(1 << j);
            DELAY(A_BIT_MORE);
        }
        Robot_LEDSSet(0);
        DELAY(A_BIT_MORE);
    }
    Robot_LEDSSet(0x555);
    DELAY(YET_A_BIT_LONGER);
    for (i = 0; i < NUM_TIMES_REPEAT_LED; i++) {
        Robot_LEDSSet(Robot_LEDSGet()^0xFFF); // toggle bits on LED
        DELAY(YET_A_BIT_LONGER);
    }
    Robot_LEDSSet(0);
    printf("\r\nTo test a roach, click a bumper.  Each bumper runs a specific test.");
    printf("\r\n\tFront Left: display the current battery voltage");
    printf("\r\n\tFront Right: Display the Light level live");
    printf("\r\n\tRear Left: Test left motor");
    printf("\r\n\tRear Right: Test right motor");
    while (1) {
        // wait for bumper press
        switch (Robot_ReadBumpers()) {

            case FLEFT_BUMP_MASK: // Battery Voltage live output
                FlashLEDBar(1);
                DELAY(A_LOT);
                scaledValue = Robot_BatteryVoltage();
                printf("\r\nBattery voltage is %d", scaledValue);
                scaledValue -= LOW_BAT;
                scaledValue *= 12;
                scaledValue /= (HIGH_BAT - LOW_BAT);
                Robot_BarGraph(scaledValue);
                DELAY(A_LOT << 2);
                Robot_LEDSSet(0);
                printf("\r\nBattery Level Test Complete");
                DELAY(A_BIT);
                FlashLEDBar(1);
                break;

            case FRIGHT_BUMP_MASK: // Light Sensor live output
                FlashLEDBar(2);
                DELAY(A_LOT);
                for (i = 0; i < A_LOT >> 2; i++) {
                    scaledValue = Robot_LightLevel();
                    if (i % 10000 == 0) {
                        printf("\r\nCurrent Light Level: %d", scaledValue);
                    }
                    scaledValue *= 12;
                    scaledValue /= 1023;
                    Robot_BarGraph(scaledValue);
                }
                printf("\r\nLight Level Test Complete");
                DELAY(A_LOT);
                FlashLEDBar(2);
                break;

            case RLEFT_BUMP_MASK: // Left motor progression
                FlashLEDBar(3);
                motorSpeed = 100;
                DELAY(A_LOT);
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b111100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b011100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b001100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b000100000000);
                DELAY(MOTOR_TIME);
                motorSpeed = 0;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0);
                DELAY(MOTOR_TIME);
                motorSpeed = -100;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b1111);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0111);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0011);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0001);
                DELAY(MOTOR_TIME);
                motorSpeed = 0;
                printf("\r\nLeft Motor at %d", motorSpeed);
                Robot_LeftMtrSpeed(motorSpeed);
                Robot_LEDSSet(0);
                DELAY(A_LOT);
                printf("\r\nLeft Motor Test Complete");
                FlashLEDBar(3);
                break;

            case RRIGHT_BUMP_MASK:
                FlashLEDBar(4);
                DELAY(A_LOT);
                motorSpeed = 100;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b111100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b011100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b001100000000);
                DELAY(MOTOR_TIME);
                motorSpeed -= 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b000100000000);
                DELAY(MOTOR_TIME);
                motorSpeed = 0;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0);
                DELAY(MOTOR_TIME);
                motorSpeed = -100;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(-100);
                Robot_LEDSSet(0b1111);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0111);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0011);
                DELAY(MOTOR_TIME);
                motorSpeed += 20;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0b0001);
                DELAY(MOTOR_TIME);
                motorSpeed = 0;
                printf("\r\nRight Motor at %d", motorSpeed);
                Robot_RightMtrSpeed(motorSpeed);
                Robot_LEDSSet(0);
                DELAY(A_LOT);
                printf("\r\nRight Motor Test Complete");
                FlashLEDBar(4);
                break;
        }
        // Left motor progression
        // right motor progression


    }
    while (1);
}

void FlashLEDBar(uint8_t numtimes) {
    unsigned int wait, i;
    Robot_LEDSSet(0);
    for (i = 0; i < numtimes; i++) {
        Robot_LEDSSet(0xFFF);
        DELAY(YET_A_BIT_LONGER);
        Robot_LEDSSet(0x000);
        DELAY(YET_A_BIT_LONGER);
    }
}
#endif