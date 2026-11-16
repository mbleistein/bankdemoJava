//PRINT    PROC HIQUAL1='MFI01',HIQUAL2='MFIDEMO',                    
// SOUT='*',GEN='0',PRM=''
//PRINT    EXEC PGM=ZBNKPRT1,PARM='&PRM'
//EXTRACT  DD DSN=&HIQUAL1..&HIQUAL2..BANKSRT1(&GEN),DISP=SHR   
//PRINTOUT DD SYSOUT=&SOUT
//* *** $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm   
