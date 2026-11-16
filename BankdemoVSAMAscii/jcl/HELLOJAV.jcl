//HELLOJAV JOB CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1)
//*
//* Demonstration: COBOL bootstrap calling Java.
//* The COBOL program HELLOJAV calls Java.HelloBatch.run()
//*
//STEP1    EXEC PGM=HELLOJAV
//STEPLIB  DD  DSN=LOADLIB,DISP=SHR
//SYSOUT   DD  SYSOUT=*
//STDOUT   DD  SYSOUT=*
//STDERR   DD  SYSOUT=*
//CEEOPTS  DD *
   ENVAR("ESOS_TEST_VAR=HELLO_FROM_ESOS")
   ENVAR("ESOS_GREETING_NAME=Scot Nielsen")
   ENVAR("JAVA_TOOL_OPTIONS=")   
//*ENVAR("JAVA_TOOL_OPTIONS=-agentlib:jdwp=transport=dt_socket, +
//*       server=n,suspend=y,address=localhost:8000")
/*
//
