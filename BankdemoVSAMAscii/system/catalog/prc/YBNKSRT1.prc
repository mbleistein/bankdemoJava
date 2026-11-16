//SORT    PROC HIQUAL1='MFI01',HIQUAL2='MFIDEMO',                     
// SOUT='*',GEN='0',MBR=KBNKSRT1                                      
//* ******************************************************************
//* PROC TO SORT BANK STATEMENT DATA                                 *
//*   //GO  EXEC YBNKSRT1                                            *
//* ******************************************************************
//SORT     EXEC PGM=SORT                                              
//*//EXITLIB  DD DSN=&HIQUAL1..&HIQUAL2..LOADLIB,DISP=SHR                
//SYSOUT   DD SYSOUT=&SOUT                                            
//SORTIN   DD DSN=&HIQUAL1..&HIQUAL2..BANKEXT1(&GEN),DISP=SHR         
//SORTOUT  DD DSN=&HIQUAL1..&HIQUAL2..BANKSRT1(+1),                   
//*   - NULL (ALL DATA EXTRACTED)                                    *
//            DISP=(NEW,CATLG,DELETE),                                
//            DCB=(RECFM=VB,LRECL=99,BLKSIZE=990),                    
//            UNIT=SYSDA,SPACE=(TRK,(2,1),RLSE)                       
//SYSIN    DD DSN=&HIQUAL1..&HIQUAL2..CTLCARDS(&MBR),DISP=SHR         
//*                                                                   
//* *** $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm   
