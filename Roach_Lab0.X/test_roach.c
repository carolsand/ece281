/*
 * File:   test_roach.c
 * Author: cris vasquez
 * Class: ECE218 - Spring 2024
 * 
 * Created on April 6, 2024, 12:10 AM
 */

#define DARK_THRESHOLD 999
#define LIGHT_THRESHOLD 333


#include <BOARD.h>
#include <stdio.h>
#include <roach.h>

// this file is intended to test the roach robot from ECE218 - Lab 0
int i  = 0;
unsigned int lightLvl = 0;


int main(void) {

    // INITIALIZATION 
    BOARD_Init();
    Roach_Init();

    printf("Hello World!\n");

    printf("Running Motors\n");
    
    //run wheels forward
    Roach_LeftMtrSpeed(50);
    Roach_RightMtrSpeed(50);
    
    for(i=0; i<1000000; i++){
        ; // wait
    }
    
    //run wheels backwards
    Roach_LeftMtrSpeed(-50);
    Roach_RightMtrSpeed(-50);
    
    
    for(i=0; i<1000000; i++){
        ; // wait
    }
    
    //print out battery level
    unsigned int batteryLevel = Roach_BatteryVoltage();
    printf("The battery level of this roach is %d", batteryLevel);
    
    
    char LEDvalue = 0;
    while (1) {
        
        lightLvl = Roach_LightLevel();
       
        LEDvalue = lightLvl >> 2; //divide lightLvl by 4 in order to get a number to represent LEDs
        Roach_LEDSSet(LEDvalue); 
        
        ;
    }
}
