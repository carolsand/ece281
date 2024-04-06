/*
 * File:   test_roach.c
 * Author: cris vasquez
 * Class: ECE218 - Spring 2024
 * 
 * Created on April 6, 2024, 12:10 AM
 */

#include <BOARD.h>
#include <stdio.h>
#include <roach.h>

int main(void) {

    // INITIALIZATION 
    BOARD_Init();
    Roach_Init();

    printf("Hello World!");

    while (1) {
        ;
    }
}
