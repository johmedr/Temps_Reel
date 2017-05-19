#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/functions.o \
	${OBJECTDIR}/global.o \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-I/usr/destijl -I/usr/xenomai/include/mercury -I/usr/xenomai/include -D_GNU_SOURCE -D_REENTRANT -D__MERCURY__ -I/usr/xenomai/include/alchemy -lalchemy -lcopperplate -L/usr/xenomai/lib -lmercury -lpthread -lrt -Wl,-R/usr/xenomai/lib -L/opt/vc/lib -I/usr/local/include -lopencv_highgui -lopencv_core -lopencv_imgcodecs -lraspicam_cv -lopencv_imgproc
CXXFLAGS=-I/usr/destijl -I/usr/xenomai/include/mercury -I/usr/xenomai/include -D_GNU_SOURCE -D_REENTRANT -D__MERCURY__ -I/usr/xenomai/include/alchemy -lalchemy -lcopperplate -L/usr/xenomai/lib -lmercury -lpthread -lrt -Wl,-R/usr/xenomai/lib -L/opt/vc/lib -I/usr/local/include -lopencv_highgui -lopencv_core -lopencv_imgcodecs -lraspicam_cv -lopencv_imgproc

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/projetdestijl_perso

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/projetdestijl_perso: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/projetdestijl_perso ${OBJECTFILES} ${LDLIBSOPTIONS} -I/usr/destijl -I/usr/xenomai/include/mercury -I/usr/xenomai/include -D_GNU_SOURCE -D_REENTRANT -D__MERCURY__ -I/usr/xenomai/include/alchemy /home/pi/RT_TP/C-TP-RT/obj/serial.o /home/pi/RT_TP/C-TP-RT/obj/imagerie.o /home/pi/RT_TP/C-TP-RT/obj/tcpServer.o -lalchemy -lcopperplate /usr/xenomai/lib/xenomai/bootstrap.o -Wl,--wrap=main -Wl,--dynamic-list=/usr/xenomai/lib/dynlist.ld -L/usr/xenomai/lib -lmercury -lpthread -lrt -Wl,-R/usr/xenomai/lib -L/opt/vc/lib -I/usr/local/include -lopencv_highgui -lopencv_core -lopencv_imgcodecs -lraspicam_cv -lopencv_imgproc

${OBJECTDIR}/functions.o: functions.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -w -I/../../Desktop/xenomai-3.0.4/include/alchemy -I/../../Desktop/xenomai-3.0.4/include/copperplate -I/../../Desktop/xenomai-3.0.4/include/xenomai -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/functions.o functions.cpp

${OBJECTDIR}/global.o: global.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -w -I/../../Desktop/xenomai-3.0.4/include/alchemy -I/../../Desktop/xenomai-3.0.4/include/copperplate -I/../../Desktop/xenomai-3.0.4/include/xenomai -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/global.o global.cpp

${OBJECTDIR}/main.o: main.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -w -I/../../Desktop/xenomai-3.0.4/include/alchemy -I/../../Desktop/xenomai-3.0.4/include/copperplate -I/../../Desktop/xenomai-3.0.4/include/xenomai -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
