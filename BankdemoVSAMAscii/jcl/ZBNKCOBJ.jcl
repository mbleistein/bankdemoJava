//ZBNKCOBJ JOB CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1)
//*
//* Demonstration: COBOL bootstrap calling Java.
//* The COBOL program CJBANK calls com.amcpresales.BankReport.run()
//*
//STEP1    EXEC PGM=CJBANK
//STEPLIB  DD  DSN=LOADLIB,DISP=SHR
//EXTRACT  DD  DSN=MFI01.MFIDEMO.EXTRACT,DISP=SHR                      
//PRINTOUT DD  SYSOUT=*
//STDOUT   DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//STDERR   DD  SYSOUT=*
//*//CEEOPTS  DD *
//*ENVAR("JAVA_TOOL_OPTIONS=")
/*
//
