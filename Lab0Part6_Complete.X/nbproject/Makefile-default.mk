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
FINAL_IMAGE=${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/ES_CheckEvents.c C:/ECE118/src/ES_Framework.c C:/ECE118/src/ES_KeyboardInput.c C:/ECE118/src/ES_PostList.c C:/ECE118/src/ES_Queue.c C:/ECE118/src/ES_TattleTale.c C:/ECE118/src/ES_Timers.c C:/ECE118/src/pwm.c C:/ECE118/src/roach.c C:/ECE118/src/serial.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1975241074/AD.o ${OBJECTDIR}/_ext/1975241074/BOARD.o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o ${OBJECTDIR}/_ext/1975241074/pwm.o ${OBJECTDIR}/_ext/1975241074/roach.o ${OBJECTDIR}/_ext/1975241074/serial.o ${OBJECTDIR}/_ext/1318786589/BattBumpService.o ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1975241074/AD.o.d ${OBJECTDIR}/_ext/1975241074/BOARD.o.d ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d ${OBJECTDIR}/_ext/1975241074/pwm.o.d ${OBJECTDIR}/_ext/1975241074/roach.o.d ${OBJECTDIR}/_ext/1975241074/serial.o.d ${OBJECTDIR}/_ext/1318786589/BattBumpService.o.d ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o.d ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1975241074/AD.o ${OBJECTDIR}/_ext/1975241074/BOARD.o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o ${OBJECTDIR}/_ext/1975241074/pwm.o ${OBJECTDIR}/_ext/1975241074/roach.o ${OBJECTDIR}/_ext/1975241074/serial.o ${OBJECTDIR}/_ext/1318786589/BattBumpService.o ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o

# Source Files
SOURCEFILES=C:/ECE118/src/AD.c C:/ECE118/src/BOARD.c C:/ECE118/src/ES_CheckEvents.c C:/ECE118/src/ES_Framework.c C:/ECE118/src/ES_KeyboardInput.c C:/ECE118/src/ES_PostList.c C:/ECE118/src/ES_Queue.c C:/ECE118/src/ES_TattleTale.c C:/ECE118/src/ES_Timers.c C:/ECE118/src/pwm.c C:/ECE118/src/roach.c C:/ECE118/src/serial.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c



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
Device=PIC32MX340F512H
ProjectDir="C:\Users\crisvasquez\Desktop\ECE118_2024\ece118-2024\Lab0Part6_Complete.X"
ProjectName=Lab0Part6_Complete
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX340F512H
MP_LINKER_FILE_OPTION=,--script="C:\ECE118\bootloader320.ld"
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
${OBJECTDIR}/_ext/1975241074/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/417d22e47197c19c1fc3bfb77b416b06dfcfabe1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/AD.o.d" -o ${OBJECTDIR}/_ext/1975241074/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/b510415fd9472c11895d9dc2a34cba0f80acdff6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/BOARD.o.d" -o ${OBJECTDIR}/_ext/1975241074/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o: C:/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/d72bc421ab3f68399f7493dabe83d5417ba37a15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o C:/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Framework.o: C:/ECE118/src/ES_Framework.c  .generated_files/flags/default/93672d25efdee4356c6a049d695ca6ca417018eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o C:/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o: C:/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/88322ef939956320e0881df5156aa1d82765822b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o C:/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_PostList.o: C:/ECE118/src/ES_PostList.c  .generated_files/flags/default/5cbd2895c35c041b54fb45049edd06f64842ce8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o C:/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Queue.o: C:/ECE118/src/ES_Queue.c  .generated_files/flags/default/cb0067d55eba4dad9b41729c8aadb8dc1cde8877 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o C:/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o: C:/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/323bf037d1cbdc0ade2303e8b46a6bfcaf5fc345 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o C:/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Timers.o: C:/ECE118/src/ES_Timers.c  .generated_files/flags/default/5bcc952b38fd572a16df1c0bee9dbf79717e518a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o C:/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/2c2cf92667ea46abbe8ad9d4228ca872f4a39f83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/pwm.o.d" -o ${OBJECTDIR}/_ext/1975241074/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/roach.o: C:/ECE118/src/roach.c  .generated_files/flags/default/6101daef5f2bde01765cbdc704eb9f9f324bef31 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/roach.o.d" -o ${OBJECTDIR}/_ext/1975241074/roach.o C:/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/5353023b2094bde52d5fb26c5a39ccb27a4b33e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/serial.o.d" -o ${OBJECTDIR}/_ext/1975241074/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/BattBumpService.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c  .generated_files/flags/default/85d8039d04f05f3c8b4f916c605e2683d0372333 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/BattBumpService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/BattBumpService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/BattBumpService.o.d" -o ${OBJECTDIR}/_ext/1318786589/BattBumpService.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/LightEventChecker.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c  .generated_files/flags/default/88107a7f13567fa60a284de68653618cb777f7b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/LightEventChecker.o.d" -o ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c  .generated_files/flags/default/a2e815bf9f64171f837f8b19533fcb5750c7424d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o.d" -o ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1975241074/AD.o: C:/ECE118/src/AD.c  .generated_files/flags/default/82cf087f75df18cc2dbd0ccf664b10e1f72eb554 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/AD.o.d" -o ${OBJECTDIR}/_ext/1975241074/AD.o C:/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/BOARD.o: C:/ECE118/src/BOARD.c  .generated_files/flags/default/fc65721e22a3da8789589e4208890f4ed46d3298 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/BOARD.o.d" -o ${OBJECTDIR}/_ext/1975241074/BOARD.o C:/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o: C:/ECE118/src/ES_CheckEvents.c  .generated_files/flags/default/5e41b0b215a2cb64d5a64dbca2a76c76550701e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_CheckEvents.o C:/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Framework.o: C:/ECE118/src/ES_Framework.c  .generated_files/flags/default/63dbe393c23a8ea24d63437e6bae4544864ded47 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Framework.o C:/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o: C:/ECE118/src/ES_KeyboardInput.c  .generated_files/flags/default/832b4b9ae68744593ec1f41fc8a77cbc9a88f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_KeyboardInput.o C:/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_PostList.o: C:/ECE118/src/ES_PostList.c  .generated_files/flags/default/5b79cfcf3de2024de29c04dd5637ef264b1d64a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_PostList.o C:/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Queue.o: C:/ECE118/src/ES_Queue.c  .generated_files/flags/default/8defa17bd7346fbe9ae15fe9eff1bcf35c728b86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Queue.o C:/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o: C:/ECE118/src/ES_TattleTale.c  .generated_files/flags/default/16f12c1d1aaa6ebe2f8033f2cae58587cdf525ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_TattleTale.o C:/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/ES_Timers.o: C:/ECE118/src/ES_Timers.c  .generated_files/flags/default/c5eadc464c6c96d175f6f6e91028e217f9d30675 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1975241074/ES_Timers.o C:/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/pwm.o: C:/ECE118/src/pwm.c  .generated_files/flags/default/776a5d152fbbb3adeb865e496f19e13a271c9366 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/pwm.o.d" -o ${OBJECTDIR}/_ext/1975241074/pwm.o C:/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/roach.o: C:/ECE118/src/roach.c  .generated_files/flags/default/affe35e3fee0742fba337d666fcd364d197302f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/roach.o.d" -o ${OBJECTDIR}/_ext/1975241074/roach.o C:/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1975241074/serial.o: C:/ECE118/src/serial.c  .generated_files/flags/default/60ec12214fb31aff5b4fcda3d2e913f1efd89e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1975241074" 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1975241074/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1975241074/serial.o.d" -o ${OBJECTDIR}/_ext/1975241074/serial.o C:/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/BattBumpService.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c  .generated_files/flags/default/ef614e7f9b1ad9193f46677a51ed5871c7518980 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/BattBumpService.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/BattBumpService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/BattBumpService.o.d" -o ${OBJECTDIR}/_ext/1318786589/BattBumpService.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/BattBumpService.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/LightEventChecker.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c  .generated_files/flags/default/3686f44051221a8ab5d3b72e1c57f2a7d81e9dd8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/LightEventChecker.o.d" -o ${OBJECTDIR}/_ext/1318786589/LightEventChecker.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/LightEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o: C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c  .generated_files/flags/default/6fff9fdf3a556b9df3b6bfe82ac8f8d950e3cb2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1318786589" 
	@${RM} ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -DSIMPLESERVICE_TEST -I"." -I"C:/ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o.d" -o ${OBJECTDIR}/_ext/1318786589/Part6_ES_Main.o C:/Users/crisvasquez/Desktop/ECE118_2024/ece118-2024/Lab0Part6_Complete.X/Part6_ES_Main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Lab0Part6_Complete.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
