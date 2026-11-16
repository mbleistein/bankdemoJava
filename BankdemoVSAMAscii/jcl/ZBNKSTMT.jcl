//MFIDEMO  JOB MFIDEMO,MFIDEMO,CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),     
//  NOTIFY=MFIDEMO                                                    
//EXTRACT  EXEC YBNKEXTV,REQUEST=B0004
//SORT     EXEC YBNKSRT1,GEN='+1'
//PRINT    EXEC YBNKPRT1,GEN='+1',SOUT=A                              
//*                                                                   
//* *** $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm   
