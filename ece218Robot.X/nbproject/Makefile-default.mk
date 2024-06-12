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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
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
SOURCEFILES_QUOTED_IF_SPACED=../ece218Robot.X/FinalES_Main.c ../ece218Robot.X/FinalEventChecker.c ../ece218Robot.X/FindTowerSubHSM.c ../ece218Robot.X/Robot.c ../ece218Robot.X/Robot_HSM.c ../../../../../devprojects/ECE118/src/AD.c ../../../../../devprojects/ECE118/src/BOARD.c ../../../../../devprojects/ECE118/src/ES_CheckEvents.c ../../../../../devprojects/ECE118/src/ES_Framework.c ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c ../../../../../devprojects/ECE118/src/ES_PostList.c ../../../../../devprojects/ECE118/src/ES_TattleTale.c ../../../../../devprojects/ECE118/src/ES_Timers.c ../../../../../devprojects/ECE118/src/IO_Ports.c ../../../../../devprojects/ECE118/src/LED.c ../../../../../devprojects/ECE118/src/RC_Servo.c ../../../../../devprojects/ECE118/src/pwm.c ../../../../../devprojects/ECE118/src/serial.c ../../../../../devprojects/ECE118/src/timers.c ../../../../../devprojects/ECE118/src/ES_Queue.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ${OBJECTDIR}/_ext/2087666291/Robot.o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ${OBJECTDIR}/_ext/507648875/AD.o ${OBJECTDIR}/_ext/507648875/BOARD.o ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o ${OBJECTDIR}/_ext/507648875/ES_Framework.o ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o ${OBJECTDIR}/_ext/507648875/ES_PostList.o ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o ${OBJECTDIR}/_ext/507648875/ES_Timers.o ${OBJECTDIR}/_ext/507648875/IO_Ports.o ${OBJECTDIR}/_ext/507648875/LED.o ${OBJECTDIR}/_ext/507648875/RC_Servo.o ${OBJECTDIR}/_ext/507648875/pwm.o ${OBJECTDIR}/_ext/507648875/serial.o ${OBJECTDIR}/_ext/507648875/timers.o ${OBJECTDIR}/_ext/507648875/ES_Queue.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d ${OBJECTDIR}/_ext/2087666291/Robot.o.d ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d ${OBJECTDIR}/_ext/507648875/AD.o.d ${OBJECTDIR}/_ext/507648875/BOARD.o.d ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/507648875/ES_Framework.o.d ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/507648875/ES_PostList.o.d ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o.d ${OBJECTDIR}/_ext/507648875/ES_Timers.o.d ${OBJECTDIR}/_ext/507648875/IO_Ports.o.d ${OBJECTDIR}/_ext/507648875/LED.o.d ${OBJECTDIR}/_ext/507648875/RC_Servo.o.d ${OBJECTDIR}/_ext/507648875/pwm.o.d ${OBJECTDIR}/_ext/507648875/serial.o.d ${OBJECTDIR}/_ext/507648875/timers.o.d ${OBJECTDIR}/_ext/507648875/ES_Queue.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ${OBJECTDIR}/_ext/2087666291/Robot.o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ${OBJECTDIR}/_ext/507648875/AD.o ${OBJECTDIR}/_ext/507648875/BOARD.o ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o ${OBJECTDIR}/_ext/507648875/ES_Framework.o ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o ${OBJECTDIR}/_ext/507648875/ES_PostList.o ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o ${OBJECTDIR}/_ext/507648875/ES_Timers.o ${OBJECTDIR}/_ext/507648875/IO_Ports.o ${OBJECTDIR}/_ext/507648875/LED.o ${OBJECTDIR}/_ext/507648875/RC_Servo.o ${OBJECTDIR}/_ext/507648875/pwm.o ${OBJECTDIR}/_ext/507648875/serial.o ${OBJECTDIR}/_ext/507648875/timers.o ${OBJECTDIR}/_ext/507648875/ES_Queue.o

# Source Files
SOURCEFILES=../ece218Robot.X/FinalES_Main.c ../ece218Robot.X/FinalEventChecker.c ../ece218Robot.X/FindTowerSubHSM.c ../ece218Robot.X/Robot.c ../ece218Robot.X/Robot_HSM.c ../../../../../devprojects/ECE118/src/AD.c ../../../../../devprojects/ECE118/src/BOARD.c ../../../../../devprojects/ECE118/src/ES_CheckEvents.c ../../../../../devprojects/ECE118/src/ES_Framework.c ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c ../../../../../devprojects/ECE118/src/ES_PostList.c ../../../../../devprojects/ECE118/src/ES_TattleTale.c ../../../../../devprojects/ECE118/src/ES_Timers.c ../../../../../devprojects/ECE118/src/IO_Ports.c ../../../../../devprojects/ECE118/src/LED.c ../../../../../devprojects/ECE118/src/RC_Servo.c ../../../../../devprojects/ECE118/src/pwm.c ../../../../../devprojects/ECE118/src/serial.c ../../../../../devprojects/ECE118/src/timers.c ../../../../../devprojects/ECE118/src/ES_Queue.c



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
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/2087666291/FinalES_Main.o: ../ece218Robot.X/FinalES_Main.c  .generated_files/flags/default/920dbc214e318b68bdc0531ff268d4ae31cc3344 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ../ece218Robot.X/FinalES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o: ../ece218Robot.X/FinalEventChecker.c  .generated_files/flags/default/5b0c3eb2b4c5b87eaea0164157e1c9a10bb63c07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ../ece218Robot.X/FinalEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o: ../ece218Robot.X/FindTowerSubHSM.c  .generated_files/flags/default/534ddb26870d720a1794c54548a6e1545caf3530 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ../ece218Robot.X/FindTowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot.o: ../ece218Robot.X/Robot.c  .generated_files/flags/default/f0635047201657dbc04beff5661bb60055b1837 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot.o ../ece218Robot.X/Robot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot_HSM.o: ../ece218Robot.X/Robot_HSM.c  .generated_files/flags/default/c1d5ad79d7bed07e58e3d80480618558d46b7b9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ../ece218Robot.X/Robot_HSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/AD.o: ../../../../../devprojects/ECE118/src/AD.c  .generated_files/flags/default/ce432cfdec7ed1b03294014b9b8732d6d78572f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/AD.o.d" -o ${OBJECTDIR}/_ext/507648875/AD.o ../../../../../devprojects/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/BOARD.o: ../../../../../devprojects/ECE118/src/BOARD.c  .generated_files/flags/default/c96d34d590c7fbbbb5cc11536561e64990fee6ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/BOARD.o.d" -o ${OBJECTDIR}/_ext/507648875/BOARD.o ../../../../../devprojects/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o: ../../../../../devprojects/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/f2945e0efab61b02fd6b24067f143d33aac49456 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o ../../../../../devprojects/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Framework.o: ../../../../../devprojects/ECE118/src/ES_Framework.c  .generated_files/flags/default/58af2987f6421e8dc5aa242f562392bdec05ace1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Framework.o ../../../../../devprojects/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o: ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/b3e220d69d0741b37e34e3d1f1abfc7a4d49112c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_PostList.o: ../../../../../devprojects/ECE118/src/ES_PostList.c  .generated_files/flags/default/9872cd42e8973753ca1d423cfa709b7835e41439 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_PostList.o ../../../../../devprojects/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_TattleTale.o: ../../../../../devprojects/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/4f2e14ed8825810e2bbe70e061576d10439f9c1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o ../../../../../devprojects/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Timers.o: ../../../../../devprojects/ECE118/src/ES_Timers.c  .generated_files/flags/default/702bd392ee90cae62fe88fad056654656b5a554f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Timers.o ../../../../../devprojects/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/IO_Ports.o: ../../../../../devprojects/ECE118/src/IO_Ports.c  .generated_files/flags/default/7177f0cdf301a2c5b4406973a7be13e98d5ba435 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/507648875/IO_Ports.o ../../../../../devprojects/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/LED.o: ../../../../../devprojects/ECE118/src/LED.c  .generated_files/flags/default/1ba07438baa482c8768bc45c489e41ab4f2fb625 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/LED.o.d" -o ${OBJECTDIR}/_ext/507648875/LED.o ../../../../../devprojects/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/RC_Servo.o: ../../../../../devprojects/ECE118/src/RC_Servo.c  .generated_files/flags/default/96e7f45864b5bcd99ad38deaeb905519656659e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/507648875/RC_Servo.o ../../../../../devprojects/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/pwm.o: ../../../../../devprojects/ECE118/src/pwm.c  .generated_files/flags/default/b56f929c67aab3b710aefbcaf6e7612c93d9cc4c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/pwm.o.d" -o ${OBJECTDIR}/_ext/507648875/pwm.o ../../../../../devprojects/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/serial.o: ../../../../../devprojects/ECE118/src/serial.c  .generated_files/flags/default/9ce45c22d5290b0f063c194d4ba540a6f7f0c7b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/serial.o.d" -o ${OBJECTDIR}/_ext/507648875/serial.o ../../../../../devprojects/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/timers.o: ../../../../../devprojects/ECE118/src/timers.c  .generated_files/flags/default/11c504ca89719fa98ce97a50e66a7c22fa5f3bd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/timers.o.d" -o ${OBJECTDIR}/_ext/507648875/timers.o ../../../../../devprojects/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Queue.o: ../../../../../devprojects/ECE118/src/ES_Queue.c  .generated_files/flags/default/96f0dbe91597f7afa61847abdcfc7ce5c82fa787 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Queue.o ../../../../../devprojects/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2087666291/FinalES_Main.o: ../ece218Robot.X/FinalES_Main.c  .generated_files/flags/default/6dfe80010e79299683002acb6e61c008c4242b0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalES_Main.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalES_Main.o ../ece218Robot.X/FinalES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o: ../ece218Robot.X/FinalEventChecker.c  .generated_files/flags/default/75dda5c1ac86e2f8c54baf6390b49c05f511ab48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o.d" -o ${OBJECTDIR}/_ext/2087666291/FinalEventChecker.o ../ece218Robot.X/FinalEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o: ../ece218Robot.X/FindTowerSubHSM.c  .generated_files/flags/default/eada1f927631b560bfbf1dca28710c80f6b6743f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/FindTowerSubHSM.o ../ece218Robot.X/FindTowerSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot.o: ../ece218Robot.X/Robot.c  .generated_files/flags/default/bd99c8611cd3e273b386966f77289544c830cd10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot.o ../ece218Robot.X/Robot.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087666291/Robot_HSM.o: ../ece218Robot.X/Robot_HSM.c  .generated_files/flags/default/ac285621cdad680278590dd83f7d5e585b04763b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2087666291" 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/2087666291/Robot_HSM.o.d" -o ${OBJECTDIR}/_ext/2087666291/Robot_HSM.o ../ece218Robot.X/Robot_HSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/AD.o: ../../../../../devprojects/ECE118/src/AD.c  .generated_files/flags/default/de2e11bceedc69f5569bf84b14284e0575dcae5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/AD.o.d" -o ${OBJECTDIR}/_ext/507648875/AD.o ../../../../../devprojects/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/BOARD.o: ../../../../../devprojects/ECE118/src/BOARD.c  .generated_files/flags/default/bf675851bf5dec56cca8f86187b501b22bca0d83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/BOARD.o.d" -o ${OBJECTDIR}/_ext/507648875/BOARD.o ../../../../../devprojects/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o: ../../../../../devprojects/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/f96668d5b20d55a711443039dc5e6d8dd2fc9e96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_CheckEvents.o ../../../../../devprojects/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Framework.o: ../../../../../devprojects/ECE118/src/ES_Framework.c  .generated_files/flags/default/7d2a02155588027eff96ab9bff02cd4675d1dd4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Framework.o ../../../../../devprojects/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o: ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/cfb9569f0b15d18983363c45974c67beac922db4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_KeyboardInput.o ../../../../../devprojects/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_PostList.o: ../../../../../devprojects/ECE118/src/ES_PostList.c  .generated_files/flags/default/5c2115aa0946b893d3d12b12b90d0dc68f628ab1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_PostList.o ../../../../../devprojects/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_TattleTale.o: ../../../../../devprojects/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/ae38297e2767bac9a9ff03b9afc40ae1fef9edb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_TattleTale.o ../../../../../devprojects/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Timers.o: ../../../../../devprojects/ECE118/src/ES_Timers.c  .generated_files/flags/default/290a53b21d1039315b7eed308b6fe9e22c2d657b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Timers.o ../../../../../devprojects/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/IO_Ports.o: ../../../../../devprojects/ECE118/src/IO_Ports.c  .generated_files/flags/default/4ee6d5bfe1fb9e233ce8386501246ef34cb4df57 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/507648875/IO_Ports.o ../../../../../devprojects/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/LED.o: ../../../../../devprojects/ECE118/src/LED.c  .generated_files/flags/default/dd441018979fc2b3986e63bc4471598139078ca5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/LED.o.d" -o ${OBJECTDIR}/_ext/507648875/LED.o ../../../../../devprojects/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/RC_Servo.o: ../../../../../devprojects/ECE118/src/RC_Servo.c  .generated_files/flags/default/938c81475bee2f491b63fc2b062088170c75d0c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/507648875/RC_Servo.o ../../../../../devprojects/ECE118/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/pwm.o: ../../../../../devprojects/ECE118/src/pwm.c  .generated_files/flags/default/4da1746d05893bf3e1aec3d2626de2baf8f3526c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/pwm.o.d" -o ${OBJECTDIR}/_ext/507648875/pwm.o ../../../../../devprojects/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/serial.o: ../../../../../devprojects/ECE118/src/serial.c  .generated_files/flags/default/a75fa38adcfa474554667129aa533029f2a94c41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/serial.o.d" -o ${OBJECTDIR}/_ext/507648875/serial.o ../../../../../devprojects/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/timers.o: ../../../../../devprojects/ECE118/src/timers.c  .generated_files/flags/default/f6e083a810b4aeba81576ca5d9d981afa50c1917 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/timers.o.d" -o ${OBJECTDIR}/_ext/507648875/timers.o ../../../../../devprojects/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507648875/ES_Queue.o: ../../../../../devprojects/ECE118/src/ES_Queue.c  .generated_files/flags/default/7605cfcc243be99d14614eed7fb8f89cb60b20bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507648875" 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/507648875/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"." -I"C:/devprojects/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/507648875/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/507648875/ES_Queue.o ../../../../../devprojects/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/devprojects/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ece218Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\devprojects\ECE118\scripts\Enum_To_String.py]"
	@python C:\devprojects\ECE118\scripts\Enum_To_String.py
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
