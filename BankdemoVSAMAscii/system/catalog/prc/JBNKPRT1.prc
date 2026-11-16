//PRINT    PROC HIQUAL1='MFI01',HIQUAL2='MFIDEMO',                    
//         SOUT='*'
//PRINT    EXEC PGM=CJBANK
//EXTRACT  DD DSN=&HIQUAL1..&HIQUAL2..BANKSRT1(&GEN),DISP=SHR          
//PRINTOUT DD SYSOUT=&SOUT                                            
//STDOUT   DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//STDERR   DD SYSOUT=*
//CEEOPTS  DD *
    ENVAR("BNKPRTPARMS=2026,45000,48,5.99")
    ENVAR("JAVA_TOOL_OPTIONS=")
//*
//* *** $ Version 12.0 sequenced on Friday 3 October 2026