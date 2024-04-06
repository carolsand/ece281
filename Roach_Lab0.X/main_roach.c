/*
 * File:   main_roach.c
 * Author: cris vasquez
 * Class: ECE218 - Spring 2024
 * 
 * Created on April 4, 2024, 1:13 AM
 */

#include <BOARD.h>
#include <stdio.h>
#include <roach.h>

int main(void) {

    // INITIALIZATION 
    BOARD_Init();
    // don't forget to initialize roach
    //Roach_Init();

    printf("Hello World!");

    while (1) {
        ;
    }
}
