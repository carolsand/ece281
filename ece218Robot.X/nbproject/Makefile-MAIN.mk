#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-MAIN.mk)" "nbproject/Makefile-local-MAIN.mk"
include nbproject/Makefile-local-MAIN.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=MAIN
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/devprojects/ECE118/src/AD.c C:/devprojects/ECE118/src/BOARD.c C:/devprojects/ECE118/src/IO_Ports.c C:/devprojects/ECE118/src/LED.c C:/devprojects/ECE118/src/RC_Servo.c C:/devprojects/ECE118/src/Stepper.c C:/devprojects/ECE118/src/pwm.c C:/devprojects/ECE118/src/serial.c C:/devprojects/ECE118/src/timers.c ../ece218Robot.X/FinalES_Main.c ../ece218Robot.X/FinalEventChecker.c ../ece218Robot.X/FindTowerSubHSM.c ../ece218Robot.X/Robot.c ../ece218Robot.X/Robot_HSM.c C:/devprojects/ECE118/src/ES_CheckEvents.c C:/devprojects/ECE118/src/ES_Framework.c C:/devprojects/ECE118/src/ES_KeyboardInput.c C:/devprojects/ECE118/src/ES_PostList.c C:/devprojects/ECE118/src/ES_Queue.c C:/devprojects/ECE118/src/ES_TattleTale.c C:/devprojects/ECE118/src/ES_Timers.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2030022158/AD.o ${OBJECTDIR}/_ext/2030022158/BOARD.o ${OBJECTDIR}/_ext/2030022158/IO_Ports.o ${OBJECTDIR}/_ext/2030022158/LED.o ${OBJECTDIR}/_ext/2030022158/RC_Servo.o ${OBJECTDIR}/_ext/2030022158/Stepper.o ${OBJECTDIR}/_ext/2030022158/pwm.o ${OBJECTDIR}/_ext/2030022158/serial.o ${OBJECTDIR}/_ext/2030022158/timers.o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ${OBJECTDIR}/_ext/2087666291/Robot.o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o ${OBJECTDIR}/_ext/2030022158/ES_Framework.o ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o ${OBJECTDIR}/_ext/2030022158/ES_PostList.o ${OBJECTDIR}/_ext/2030022158/ES_Queue.o ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o ${OBJECTDIR}/_ext/2030022158/ES_Timers.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2030022158/AD.o.d ${OBJECTDIR}/_ext/2030022158/BOARD.o.d ${OBJECTDIR}/_ext/2030022158/IO_Ports.o.d ${OBJECTDIR}/_ext/2030022158/LED.o.d ${OBJECTDIR}/_ext/2030022158/RC_Servo.o.d ${OBJECTDIR}/_ext/2030022158/Stepper.o.d ${OBJECTDIR}/_ext/2030022158/pwm.o.d ${OBJECTDIR}/_ext/2030022158/serial.o.d ${OBJECTDIR}/_ext/2030022158/timers.o.d ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d ${OBJECTDIR}/_ext/2087666291/Robot.o.d ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/2030022158/ES_Framework.o.d ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/2030022158/ES_PostList.o.d ${OBJECTDIR}/_ext/2030022158/ES_Queue.o.d ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o.d ${OBJECTDIR}/_ext/2030022158/ES_Timers.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2030022158/AD.o ${OBJECTDIR}/_ext/2030022158/BOARD.o ${OBJECTDIR}/_ext/2030022158/IO_Ports.o ${OBJECTDIR}/_ext/2030022158/LED.o ${OBJECTDIR}/_ext/2030022158/RC_Servo.o ${OBJECTDIR}/_ext/2030022158/Stepper.o ${OBJECTDIR}/_ext/2030022158/pwm.o ${OBJECTDIR}/_ext/2030022158/serial.o ${OBJECTDIR}/_ext/2030022158/timers.o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ${OBJECTDIR}/_ext/2087666291/Robot.o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o ${OBJECTDIR}/_ext/2030022158/ES_Framework.o ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o ${OBJECTDIR}/_ext/2030022158/ES_PostList.o ${OBJECTDIR}/_ext/2030022158/ES_Queue.o ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o ${OBJECTDIR}/_ext/2030022158/ES_Timers.o

# Source Files
SOURCEFILES=C:/devprojects/ECE118/src/AD.c C:/devprojects/ECE118/src/BOARD.c C:/devprojects/ECE118/src/IO_Ports.c C:/devprojects/ECE118/src/LED.c C:/devprojects/ECE118/src/RC_Servo.c C:/devprojects/ECE118/src/Stepper.c C:/devprojects/ECE118/src/pwm.c C:/devprojects/ECE118/src/serial.c C:/devprojects/ECE118/src/timers.c ../ece218Robot.X/FinalES_Main.c ../ece218Robot.X/FinalEventChecker.c ../ece218Robot.X/FindTowerSubHSM.c ../ece218Robot.X/Robot.c ../ece218Robot.X/Robot_HSM.c C:/devprojects/ECE118/src/ES_CheckEvents.c C:/devprojects/ECE118/src/ES_Framework.c C:/devprojects/ECE118/src/ES_KeyboardInput.c C:/devprojects/ECE118/src/ES_PostList.c C:/devprojects/ECE118/src/ES_Queue.c C:/devprojects/ECE118/src/ES_TattleTale.c C:/devprojects/ECE118/src/ES_Timers.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MX320F128H
ProjectDir="C:\Users\carolsand\MPLABXProjects\ece118-2024\ece218Robot.X"
ProjectName=ece218Robot
ConfName=MAIN
ImagePath="dist\MAIN\${IMAGE_TYPE}\ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\MAIN\${IMAGE_TYPE}"
ImageName="ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-MAIN.mk ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\devprojects\ECE118\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2030022158/AD.o: C:/devprojects/ECE118/src/AD.c  .generated_files/flags/MAIN/3ff18b679cf66a71100bf17804d81e922aca66e7 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/AD.o.d" -o ${OBJECTDIR}/_ext/2030022158/AD.o C:/devprojects/ECE118/src/AD.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/BOARD.o: C:/devprojects/ECE118/src/BOARD.c  .generated_files/flags/MAIN/8e934619cecfefe680e82ec41f8d386a4e5a806d .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/BOARD.o.d" -o ${OBJECTDIR}/_ext/2030022158/BOARD.o C:/devprojects/ECE118/src/BOARD.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/IO_Ports.o: C:/devprojects/ECE118/src/IO_Ports.c  .generated_files/flags/MAIN/6f60848589dc32b7a32053c7fdcd2a8af2311bac .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/2030022158/IO_Ports.o C:/devprojects/ECE118/src/IO_Ports.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/LED.o: C:/devprojects/ECE118/src/LED.c  .generated_files/flags/MAIN/2cc005515f76991ebe8487c0cd06584d3bb8c4a .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/LED.o.d" -o ${OBJECTDIR}/_ext/2030022158/LED.o C:/devprojects/ECE118/src/LED.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/RC_Servo.o: C:/devprojects/ECE118/src/RC_Servo.c  .generated_files/flags/MAIN/92d53acec78cd50ce05d4a0dfcc6ea1216cdadde .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/2030022158/RC_Servo.o C:/devprojects/ECE118/src/RC_Servo.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/Stepper.o: C:/devprojects/ECE118/src/Stepper.c  .generated_files/flags/MAIN/c0b3791a0431b47b0b88f7f163c55647cf7e4295 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/Stepper.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/Stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/Stepper.o.d" -o ${OBJECTDIR}/_ext/2030022158/Stepper.o C:/devprojects/ECE118/src/Stepper.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/pwm.o: C:/devprojects/ECE118/src/pwm.c  .generated_files/flags/MAIN/5b328fd7bfda04986a1e61e30cb42eeeffa779ce .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/pwm.o.d" -o ${OBJECTDIR}/_ext/2030022158/pwm.o C:/devprojects/ECE118/src/pwm.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/serial.o: C:/devprojects/ECE118/src/serial.c  .generated_files/flags/MAIN/4c8b6c08a27b14be107e68c6d16fd560beca1672 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/serial.o.d" -o ${OBJECTDIR}/_ext/2030022158/serial.o C:/devprojects/ECE118/src/serial.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/timers.o: C:/devprojects/ECE118/src/timers.c  .generated_files/flags/MAIN/535a8c2982e4d140c2590833fb97bac068ea9400 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/timers.o.d" -o ${OBJECTDIR}/_ext/2030022158/timers.o C:/devprojects/ECE118/src/timers.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalES_Main.o: ../ece218Robot.X/FinalES_Main.c  .generated_files/flags/MAIN/246eb56163abe174bc34bbe205dc235375ee0ec .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ../ece218Robot.X/FinalES_Main.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o: ../ece218Robot.X/FinalEventChecker.c  .generated_files/flags/MAIN/505bb7eaafdb870230ab72d0f8eda0b716c23229 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ../ece218Robot.X/FinalEventChecker.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o: ../ece218Robot.X/FindTowerSubHSM.c  .generated_files/flags/MAIN/425bf2c9e987d72b08551193a852571ea1c03c81 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ../ece218Robot.X/FindTowerSubHSM.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot.o: ../ece218Robot.X/Robot.c  .generated_files/flags/MAIN/a65dda4dffb4cb62924bea9d9bdc03aff4a6bd0e .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot.o ../ece218Robot.X/Robot.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot_HSM.o: ../ece218Robot.X/Robot_HSM.c  .generated_files/flags/MAIN/9043da89f79ccdff70da452b5f0b9b144a5e51e6 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ../ece218Robot.X/Robot_HSM.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o: C:/devprojects/ECE118/src/ES_CheckEvents.c  .generated_files/flags/MAIN/69d3cb1ee697fa09b257eedb36466fb95006703f .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o C:/devprojects/ECE118/src/ES_CheckEvents.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Framework.o: C:/devprojects/ECE118/src/ES_Framework.c  .generated_files/flags/MAIN/f0540b8e3f7ec6cf2af233a0f9f645800a187507 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Framework.o C:/devprojects/ECE118/src/ES_Framework.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o: C:/devprojects/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/MAIN/fc61767ce667feae27490ecc01a305de1b82eb03 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o C:/devprojects/ECE118/src/ES_KeyboardInput.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_PostList.o: C:/devprojects/ECE118/src/ES_PostList.c  .generated_files/flags/MAIN/9901a2cd2477c08052114a06a53a7cf6910c118a .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_PostList.o C:/devprojects/ECE118/src/ES_PostList.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Queue.o: C:/devprojects/ECE118/src/ES_Queue.c  .generated_files/flags/MAIN/cbd17089653889f7d1b99b1a1c12a7c4d4fbdf4f .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Queue.o C:/devprojects/ECE118/src/ES_Queue.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o: C:/devprojects/ECE118/src/ES_TattleTale.c  .generated_files/flags/MAIN/ec08eea182ae94988988adae0c19dbf23e06c081 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o C:/devprojects/ECE118/src/ES_TattleTale.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Timers.o: C:/devprojects/ECE118/src/ES_Timers.c  .generated_files/flags/MAIN/57e7ff31e0b6984fd8942a7c462e7223f58f1e6f .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Timers.o C:/devprojects/ECE118/src/ES_Timers.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2030022158/AD.o: C:/devprojects/ECE118/src/AD.c  .generated_files/flags/MAIN/12a694f12ead5a017d76c14b58678dd35adef400 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/AD.o.d" -o ${OBJECTDIR}/_ext/2030022158/AD.o C:/devprojects/ECE118/src/AD.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/BOARD.o: C:/devprojects/ECE118/src/BOARD.c  .generated_files/flags/MAIN/d40e2f4db76d155cdbdd3e71aaad551641f7a4ea .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/BOARD.o.d" -o ${OBJECTDIR}/_ext/2030022158/BOARD.o C:/devprojects/ECE118/src/BOARD.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/IO_Ports.o: C:/devprojects/ECE118/src/IO_Ports.c  .generated_files/flags/MAIN/c20af2de41a5d2087e8a175994cc862af13de627 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/2030022158/IO_Ports.o C:/devprojects/ECE118/src/IO_Ports.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/LED.o: C:/devprojects/ECE118/src/LED.c  .generated_files/flags/MAIN/9f0fc736dc8eb543614a69fce65e65d1344376ca .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/LED.o.d" -o ${OBJECTDIR}/_ext/2030022158/LED.o C:/devprojects/ECE118/src/LED.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/RC_Servo.o: C:/devprojects/ECE118/src/RC_Servo.c  .generated_files/flags/MAIN/8e376d8b9394e35be4f3bf0689f78953202429a2 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/2030022158/RC_Servo.o C:/devprojects/ECE118/src/RC_Servo.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/Stepper.o: C:/devprojects/ECE118/src/Stepper.c  .generated_files/flags/MAIN/4c0a52c511249b406905184c99e1588b70704582 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/Stepper.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/Stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/Stepper.o.d" -o ${OBJECTDIR}/_ext/2030022158/Stepper.o C:/devprojects/ECE118/src/Stepper.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/pwm.o: C:/devprojects/ECE118/src/pwm.c  .generated_files/flags/MAIN/5c75fc15b043e6b2462b2e6773c0f5f8e9447b84 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/pwm.o.d" -o ${OBJECTDIR}/_ext/2030022158/pwm.o C:/devprojects/ECE118/src/pwm.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/serial.o: C:/devprojects/ECE118/src/serial.c  .generated_files/flags/MAIN/a56e2bdfa60723627af13ea24a2a71ad97a7263a .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/serial.o.d" -o ${OBJECTDIR}/_ext/2030022158/serial.o C:/devprojects/ECE118/src/serial.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/timers.o: C:/devprojects/ECE118/src/timers.c  .generated_files/flags/MAIN/9b46c5ddb1454c780bc00264579b44053062e6b8 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/timers.o.d" -o ${OBJECTDIR}/_ext/2030022158/timers.o C:/devprojects/ECE118/src/timers.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalES_Main.o: ../ece218Robot.X/FinalES_Main.c  .generated_files/flags/MAIN/8d5030905a878e6a1ed40001e97305632941aa68 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ../ece218Robot.X/FinalES_Main.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o: ../ece218Robot.X/FinalEventChecker.c  .generated_files/flags/MAIN/9dc560cae7147381aa3c9bd3e59b31ee41670dc7 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ../ece218Robot.X/FinalEventChecker.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o: ../ece218Robot.X/FindTowerSubHSM.c  .generated_files/flags/MAIN/b6eff0f34d85282bb94cd60df8e53c1492d1a15e .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ../ece218Robot.X/FindTowerSubHSM.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot.o: ../ece218Robot.X/Robot.c  .generated_files/flags/MAIN/2be0aafe829d47907a8d3ced2810632f257b795 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot.o ../ece218Robot.X/Robot.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot_HSM.o: ../ece218Robot.X/Robot_HSM.c  .generated_files/flags/MAIN/ae096a88d66172f34696c230735dadb76147d69f .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ../ece218Robot.X/Robot_HSM.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o: C:/devprojects/ECE118/src/ES_CheckEvents.c  .generated_files/flags/MAIN/c397ebd8ca692686d5ee0d4b56ba92d0359c1651 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_CheckEvents.o C:/devprojects/ECE118/src/ES_CheckEvents.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Framework.o: C:/devprojects/ECE118/src/ES_Framework.c  .generated_files/flags/MAIN/77d59833615ebbf5ee1dac5f69f1f8536deb2763 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Framework.o C:/devprojects/ECE118/src/ES_Framework.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o: C:/devprojects/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/MAIN/105788d0db54c113e40d8f6ba88ff640084d35fa .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_KeyboardInput.o C:/devprojects/ECE118/src/ES_KeyboardInput.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_PostList.o: C:/devprojects/ECE118/src/ES_PostList.c  .generated_files/flags/MAIN/52d6cb1769c7a3423529bdd15816ff08d6a16c77 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_PostList.o C:/devprojects/ECE118/src/ES_PostList.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Queue.o: C:/devprojects/ECE118/src/ES_Queue.c  .generated_files/flags/MAIN/3b85895109f582e5dbfa34bf3e752db7de6fbb63 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Queue.o C:/devprojects/ECE118/src/ES_Queue.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o: C:/devprojects/ECE118/src/ES_TattleTale.c  .generated_files/flags/MAIN/c247008ad65263b581adb46905554936f63fcef1 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_TattleTale.o C:/devprojects/ECE118/src/ES_TattleTale.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2030022158/ES_Timers.o: C:/devprojects/ECE118/src/ES_Timers.c  .generated_files/flags/MAIN/fe51f43ccc94f1b1e4b4934f11068e675ca6a062 .generated_files/flags/MAIN/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2030022158" 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/2030022158/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2030022158/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/2030022158/ES_Timers.o C:/devprojects/ECE118/src/ES_Timers.c    -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/devprojects/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/devprojects/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_MAIN=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\ECE118\scripts\Enum_To_String.py]"
	@python C:\ECE118\scripts\Enum_To_String.py
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
