      $set ilusing"java.util"
      $set ilusing"java.lang"
      $set ilusing"java.io"
      $set ilusing"com.amcpresales"
      $set ilusing"com.amcpresales.clients.cobol"
      $set ilusing"com.amcpresales.clients.java"
      $set ilusing"com.rocketsoftware.jzos"
      $set ilusing"com.rocketsoftware.jzos.ZUtil"

      *****************************************************************
      *   A COBOL Batch Program compiled as COBOL JVM
      *   It produces a report of a Banking statement
      *   Generates a PDF using Open source Java based JAR files
      *   Demonstrates COBOL JVM seamlessly working with traditional
      *   COBOL Syntax as well a modern OO syntax. 
      *   Takes advanatage of Java Cryptograph APIs, REST/JSON Client
      *   Apis, and the seamless interoperability of COBOL/JVM with 
      *   Java...
      *   all running under Rocket Software Enterprise Server 12.0!
001000*****************************************************************
001100
001200*****************************************************************
001300* Program:     ZBNKPRT1.CBL                                     *
001400* Function:    Print the bank statements                        *
001500*****************************************************************
001600 IDENTIFICATION DIVISION.
001700 PROGRAM-ID.
001800     ZBNKPRT1 as "com.amcpresales.bankdemo.ZBNKPRT1".
001900 DATE-WRITTEN.
002000     September 2002.
002100 DATE-COMPILED.
002200     Today.
002300
002400 ENVIRONMENT DIVISION.
002500 INPUT-OUTPUT   SECTION.
002600   FILE-CONTROL.
002700     SELECT EXTRACT-FILE
002800            ASSIGN       TO EXTRACT
002900            ORGANIZATION IS SEQUENTIAL
003000            ACCESS MODE  IS SEQUENTIAL
003100            FILE STATUS  IS WS-EXTRACT-STATUS.
003200     SELECT PRINTOUT-FILE
003300            ASSIGN       TO PRINTOUT
003400            ORGANIZATION IS SEQUENTIAL
003500            ACCESS MODE  IS SEQUENTIAL
003600            FILE STATUS  IS WS-PRINTOUT-STATUS.
003700
003800 DATA DIVISION.
003900 FILE SECTION.
004000
004100 FD  EXTRACT-FILE
004200     RECORDING MODE IS V
004300     RECORD CONTAINS 1 TO 95 CHARACTERS.
004400 COPY CBANKXT1.
004500
004600 FD  PRINTOUT-FILE.
004700 01  PRINTOUT-REC                            PIC X(121).
004800
004900 WORKING-STORAGE SECTION.
005000 COPY CTIMERD.
005100
005200 01  WS-DATE-WORK-AREA.
005300 COPY CDATED.
005400
005500 01  WS-MISC-STORAGE.
005600   05  WS-PROGRAM-ID                         PIC X(8)
005700       VALUE 'ZBNKPRT1'.
005800   05  WS-EXTRACT-STATUS.
005900     10  WS-EXTRACT-STAT1                    PIC X(1).
006000     10  WS-EXTRACT-STAT2                    PIC X(1).
006100
006200   05  WS-PRINTOUT-STATUS.
006300     10  WS-PRINTOUT-STAT1                   PIC X(1).
006400     10  WS-PRINOUTY-STAT2                   PIC X(1).
006500
006600   05  WS-IO-STATUS.
006700     10  WS-IO-STAT1                         PIC X(1).
006800     10  WS-IO-STAT2                         PIC X(1).
006900
007000   05  WS-TWO-BYTES.
007100     10  WS-TWO-BYTES-LEFT                   PIC X(1).
007200     10  WS-TWO-BYTES-RIGHT                  PIC X(1).
007300   05 WS-TWO-BYTES-BINARY REDEFINES WS-TWO-BYTES
007400                                             PIC 9(1) COMP.
007500
007600   05  WS-SAVED-EMAIL                        PIC X(30).
007700   05  WS-EMAIL-INDICATOR                    PIC X(1).
007800     88  EMAIL-REQUIRED                      VALUE 'Y'.
007900     88  EMAIL-NOT-REQUIRED                  VALUE 'N'.
008000
008100   05  WS-FIRST-REC                          PIC X(3)
008200       VALUE 'YES'.
008300
008400   05  WS-END-OF-FILE                       PIC X(3)
008500       VALUE 'NO '.
008600
008700   05  WS-RECORDS-READ                       PIC 9(5)
008800       VALUE ZERO.
008900
009000   05  WS-TXNS-FLAG                          PIC X(1).
009100     88  TXNS-PRINTED                        VALUE '1'.
009200     88  NO-TXNS-PRINTED                     VALUE '0'.
009300
009400   05  WS-SUB1                               PIC 9(3).
009500   05  WS-SYS-DATE                           PIC 9(5).
009600   05  WS-SYS-TIME                           PIC 9(8).
009700   05  WS-PRINTED.
009800     10  WS-PRINTED-DATE.
009900       15  FILLER                            PIC X(9)
010000           VALUE 'Printed: '.
010100       15  WS-PRINT-DATE                     PIC X(11)
010200           VALUE 'dd mmm yyyy'.
010300     10  WS-PRINTED-TIME.
010400       15  FILLER                            PIC X(12)
010500           VALUE SPACES.
010600       15  WS-PRINT-TIME.
010700         20  WS-PRINT-TIME-HH                PIC X(2).
010800         20  WS-PRINT-TIME-DOT1              PIC X(1).
010900         20  WS-PRINT-TIME-MM                PIC X(2).
011000         20  WS-PRINT-TIME-DOT2              PIC X(1).
011100         20  WS-PRINT-TIME-SS                PIC X(2).
011200   05  WS-TOTAL-TXNS                         PIC S9(7)V99 COMP-3.
011300   05  WS-TOTAL-ASSETS                       PIC S9(7)V99 COMP-3.
011400
011500
011600 01  WS-PRINT-LINES.
011700   05  WS-LINE1.
011800     10  WS-LINE1-CC                         PIC X(1)
011900         VALUE '1'.
012000     10  FILLER                              PIC X(40)
012100         VALUE SPACES.
012200     10  WS-LINE1-HEAD                       PIC X(25)
012300         VALUE 'Rocket Software Demo Bank'.
012400
012500   05  WS-LINE2.
012600     10  WS-LINE2-CC                         PIC X(1)
012700         VALUE ' '.
012800     10  FILLER                              PIC X(40)
012900         VALUE SPACES.
013000     10  WS-LINE1-HEAD                       PIC X(20)
013100         VALUE 'Statement of Account'.
013200
013300   05  WS-LINE3.
013400     10  WS-LINE3-CC                         PIC X(1)
013500         VALUE '0'.
013600     10  WS-LINE3-NAME-ADDR                  PIC X(23)
013700         VALUE SPACES.
013800     10  FILLER                              PIC X(55)
013900         VALUE SPACES.
014000     10  WS-LINE3-DATE                       PIC X(20)
014100         VALUE SPACES.
014200
014300   05  WS-LINE4.
014400     10  WS-LINE4-CC                         PIC X(1)
014500         VALUE '0'.
014600     10  FILLER                              PIC X(14)
014700         VALUE 'Account No.'.
014800     10  FILLER                              PIC X(38)
014900         VALUE 'Description '.
015000     10  FILLER                              PIC X(15)
015100         VALUE '    Date  '.
015200     10  FILLER                              PIC X(18)
015300         VALUE '      Amount '.
015400     10  FILLER                              PIC X(18)
015500         VALUE '     Balance '.
015600
015700   05  WS-LINE5.
015800     10  WS-LINE5-CC                         PIC X(1).
015900     10  WS-LINE5-ACC-NO                     PIC X(9).
016000     10  FILLER                              PIC X(5).
016100     10  WS-LINE5-DESC.
016200       15  WS-LINE5-DESC-PT1                 PIC X(15).
016300       15  WS-LINE5-DESC-PT2                 PIC X(18).
016400     10  FILLER                              PIC X(5).
016500     10  WS-LINE5-DATE                       PIC X(11).
016600     10  FILLER                              PIC X(4).
016700     10  WS-LINE5-AMOUNT-DASH                PIC X(13).
016800     10  WS-LINE5-AMOUNT REDEFINES WS-LINE5-AMOUNT-DASH
016900                                             PIC Z,ZZZ,ZZ9.99-.
017000     10  FILLER                              PIC X(5).
017100     10  WS-LINE5-BALANCE-DASH               PIC X(13).
017200     10  WS-LINE5-BALANCE REDEFINES WS-LINE5-BALANCE-DASH
017300                                             PIC Z,ZZZ,ZZZ.99-.
017400
017500 01  WS-CONSOLE-MESSAGE                      PIC X(48).
017600
017700 01  WS-EXEC-PARM.
017800   05  WS-EXEC-PARM-LL                       PIC S9(4) COMP.
017900   05  WS-EXEC-PARM-DATA                     PIC X(12).
018000
018100 COPY CSTATESD.
018200
018300 COPY CABENDD.
018400
018500 01  WS-PARM-PTR                             POINTER.
018600 01  WS-PARM-PTR-NUM REDEFINES WS-PARM-PTR   PIC 9(4) COMP.
018700
018800 01  WS-LE-AREAS.
018900   05  WS-CEE3DMP-AREAS.
019000     10  WS-CEE3DMP-DMP-TITLE                PIC X(80)
019100         VALUE 'CEEDUMP FROM HANDLER ROUTINE'.
019200     10  WS-CEE3DMP-DMP-OPTIONS              PIC X(255)
019300         VALUE 'TRACE FILE VAR STOR'.
019400     10  WS-CEE3DMP-FEEDBACK.
019500      15 WS-CEE3DMP-FB-SEV                   PIC S9(4) COMP.
019600      15 WS-CEE3DMP-FB-MSGNO                 PIC S9(4) COMP.
019700      15 WS-CEE3DMP-FB-CASE-SEV              PIC X(1).
019800      15 WS-CEE3DMP-FB-FAC-ID                PIC X(3).
019900      15 WS-CEE3DMP-FB-ISINFO                PIC S9(8) COMP.
020000   05  WS-CEELOCT-AREAS.
020100     10  WS-CEELOCT-DATE-LILIAN              PIC S9(9) BINARY.
020200     10  WS-CEELOCT-SECS-LILIAN              PIC S9(9) COMP.
020300     10  WS-CEELOCT-TIME-GREGORIAN           PIC X(17).
020400     10  WS-CEELOCT-FEEDBACK.
020500      15 WS-CEELOCT-FB-SEV                   PIC S9(4) COMP.
020600      15 WS-CEELOCT-FB-MSGNO                 PIC S9(4) COMP.
020700      15 WS-CEELOCT-FB-CASE-SEV              PIC X(1).
020800      15 WS-CEELOCT-FB-FAC-ID                PIC X(3).
020900      15 WS-CEELOCTRFB-ISINFO                PIC S9(8) COMP.
021000
       01 cal type     GregorianCalendar.
       01 LeapTest     type Boolean.
       01 cryptObject  type Crypto.
       01 cryptResult  type Crypto+DecryptInfo.
       01 recordBytes  type byte occurs any.
       01 cipherString String.
       
       copy AmortIn.     
       01 ws-amort-rec-header.
         03 Filler pic x(7) value "Payment".
         03 Filler pic x(5) value spaces.         
         03 Filler pic x(9) value "Principal".
         03 Filler pic x(5) value spaces.
         03 Filler pic x(8) value "Interest".
         03 Filler pic x(5) value spaces.
         03 Filler pic x(7) value "Balance".
         03 Filler pic x(5) value spaces. 
         
       01 ws-amort-rec.
          03 ws-amort-payment pic x(10).
          03 filler pic x(2) value spaces.
          03 ws-amort-principal pic x(10).
          03 filler pic x(4) value spaces.
          03 ws-amort-interest pic x(10).
          03 filler pic x(3) value spaces. 
          03 ws-amort-balance pic x(10).

         
       01 pdfrecs binary-long.
      *01 genObj   type GenPDF.
       01 pdfObj   type PDF.
       01 ps type PrintStream.
       01 printout type ZFile.
       01 reptLines type ArrayList[String].
       01 amortcObj type com.amcpresales.clients.cobol.ESAmortOut. 
       01 AWSAmortObj type com.amcpresales.clients.cobol.AWSAmortOut.   

021200 01  LK-EXEC-PARM.
021300   05  LK-EXEC-PARM-LL                       PIC S9(4) COMP.
021400   05  LK-EXEC-PARM-DATA                     PIC X(12).
021500
021600 PROCEDURE DIVISION using by value cmds as String occurs any.

           move "Entering" to WS-CONSOLE-MESSAGE
           invoke type 
             System ::out::println("ZBNKPRT1 - " & 
      -                         WS-CONSOLE-MESSAGE)

           MOVE ALL SPACES TO WS-CONSOLE-MESSAGE.   
           
           set cal to new GregorianCalendar
           *> Retrieve command line argument from String Array
           *> Convert String to Integer (4 digit year)
           *> Call isLeapYear method to check if Leap year
           *> All in one line of code!
           set LeapTest to
               cal::isLeapYear(type Integer::parseInt( cmds[0]) )
           if LeapTest
               invoke type 
                      System::out::println(cmds[0] & " Is Leap Year")
           else
               invoke type 
                      System::out::println(cmds[0] & " Not Leap Year")           
           end-if
           set PRINCIPAL to type Integer::parseInt(cmds[1])
           set LOANTERM  to type Integer::parseInt(cmds[2])
           set RATE      to type Float::parseFloat(cmds[3])

           set cryptObject to new com.amcpresales.Crypto()
         
021800     PERFORM RUN-TIME.
025500     ACCEPT WS-SYS-DATE FROM DAY.
025600     SET DD-ENV-NULL TO TRUE.
025700     SET DDI-YYDDD TO TRUE.
025800     MOVE WS-SYS-DATE TO DDI-DATA.
025900     SET DDO-DD-MMM-YYYY TO TRUE.
026000     CALL 'UDATECNV' USING WS-DATE-WORK-AREA.
026100     MOVE FUNCTION LOWER-CASE(DDO-DATA-DD-MMM-YYYY-MMM(2:2))
026200       TO DDO-DATA-DD-MMM-YYYY-MMM(2:2).
026300     MOVE DDO-DATA TO WS-PRINT-DATE.

026500     PERFORM EXTRACT-OPEN.
026600     PERFORM PRINTOUT-OPEN.

026800     PERFORM UNTIL WS-END-OF-FILE = 'YES'
026900       IF WS-END-OF-FILE = 'NO '
027000          PERFORM EXTRACT-GET
027100          IF WS-END-OF-FILE = 'NO '
027200             ADD 1 TO WS-RECORDS-READ
027300             IF WS-RECORDS-READ IS LESS THAN 6
027400*               DISPLAY BANKXT01-REC1 UPON CONSOLE
                      invoke type System::out::println(BANKXT01-REC1)
027500             ELSE
027600                IF WS-RECORDS-READ IS EQUAL TO 6
027700                   MOVE 'Suppressing record display...'
027800                      TO WS-CONSOLE-MESSAGE
027900                   PERFORM DISPLAY-CONSOLE-MESSAGE
028000                END-IF
028100             END-IF
028200             PERFORM FORMAT-AND-PRINT
028300          ELSE
028400             PERFORM PRINT-TOTAL-TXNS
028500             PERFORM PRINT-TOTAL-ASSETS
028600          END-IF
028700       END-IF
028800     END-PERFORM.

           declare pdfDoc = new PDF("BankStatement", 14)
           invoke pdfDoc::WritePDF(reptLines)
           invoke pdfDoc::close()
           
029000     PERFORM EXTRACT-CLOSE.
029100     PERFORM PRINTOUT-CLOSE.
      *    perform GET-LOANAMORT-JAVA
           perform GET-LOANAMORT-COBOL
           perform GET-AWS-LOANAMORT-COBOL.           
029200
029300     PERFORM DISPLAY-CONSOLE-MESSAGE.
029400     MOVE 'End Of Job'
029500       TO WS-CONSOLE-MESSAGE.
029600     PERFORM DISPLAY-CONSOLE-MESSAGE.
029700
029800     PERFORM RUN-TIME.
029900
030000     MOVE 0 TO RETURN-CODE.
030200     GOBACK.

030400*****************************************************************
030500* Format print lines                                            *
030600*****************************************************************
030700 FORMAT-AND-PRINT.
030800     IF BANKXT01-1-TYPE IS EQUAL TO '0'
030900        MOVE BANKXT01-0-EMAIL TO WS-SAVED-EMAIL
031000     END-IF.
031100     IF BANKXT01-1-TYPE IS EQUAL TO '1'
031200        PERFORM PRINT-TOTAL-TXNS
031300        PERFORM PRINT-TOTAL-ASSETS
031400        IF EMAIL-REQUIRED
031500           MOVE SPACES TO PRINTOUT-REC
031600           STRING 'SENDTO: ' DELIMITED BY SIZE
031700                  WS-SAVED-EMAIL DELIMITED BY SPACE
031800             INTO PRINTOUT-REC
031900           PERFORM PRINTOUT-PUT
032000        END-IF
032100        MOVE WS-LINE1 TO PRINTOUT-REC
032200        PERFORM PRINTOUT-PUT
032300        MOVE WS-LINE2 TO PRINTOUT-REC
032400        PERFORM PRINTOUT-PUT
032500        MOVE '0' TO WS-LINE3-CC
032600        MOVE BANKXT01-1-NAME TO WS-LINE3-NAME-ADDR
032700        MOVE WS-PRINTED-DATE TO WS-LINE3-DATE
032800        MOVE WS-LINE3 TO PRINTOUT-REC
032900        PERFORM PRINTOUT-PUT
033000        MOVE ' ' TO WS-LINE3-CC
033100        MOVE BANKXT01-1-ADDR1 TO WS-LINE3-NAME-ADDR
033200        ACCEPT WS-SYS-TIME FROM TIME
033300        MOVE WS-SYS-TIME (1:2) TO WS-PRINT-TIME-HH
033400        MOVE ':' TO WS-PRINT-TIME-DOT1
033500        MOVE WS-SYS-TIME (3:2) TO WS-PRINT-TIME-MM
033600        MOVE ':' TO WS-PRINT-TIME-DOT2
033700        MOVE WS-SYS-TIME (5:2) TO WS-PRINT-TIME-SS
033800        MOVE WS-PRINTED-TIME TO WS-LINE3-DATE
033900        MOVE WS-LINE3 TO PRINTOUT-REC
034000        PERFORM PRINTOUT-PUT
034100        MOVE ' ' TO WS-LINE3-CC
034200        MOVE BANKXT01-1-ADDR2 TO WS-LINE3-NAME-ADDR
034300        MOVE SPACES TO WS-LINE3-DATE
034400        MOVE WS-LINE3 TO PRINTOUT-REC
034500        PERFORM PRINTOUT-PUT
034600        MOVE ' ' TO WS-LINE3-CC
034700        MOVE BANKXT01-1-STATE TO STATE-PROV-WK-CODE
034800        PERFORM EXPAND-STATE-PROV THRU
034900                EXPAND-STATE-PROV-EXIT
035000        MOVE STATE-PROV-WK-NAME TO WS-LINE3-NAME-ADDR
035100        MOVE SPACES TO WS-LINE3-DATE
035200        MOVE WS-LINE3 TO PRINTOUT-REC
035300        PERFORM PRINTOUT-PUT
035400        MOVE ' ' TO WS-LINE3-CC
035500        MOVE BANKXT01-1-CNTRY TO WS-LINE3-NAME-ADDR
035600        MOVE SPACES TO WS-LINE3-DATE
035700        MOVE WS-LINE3 TO PRINTOUT-REC
035800        PERFORM PRINTOUT-PUT
035900        MOVE ' ' TO WS-LINE3-CC
036000        MOVE BANKXT01-1-PST-CDE TO WS-LINE3-NAME-ADDR
036100        MOVE SPACES TO WS-LINE3-DATE
036200        MOVE WS-LINE3 TO PRINTOUT-REC
036300        PERFORM PRINTOUT-PUT
036400        MOVE WS-LINE4 TO PRINTOUT-REC
036500        PERFORM PRINTOUT-PUT
036600        MOVE ZERO TO WS-TOTAL-TXNS
036700        MOVE ZERO TO WS-TOTAL-ASSETS
036800     END-IF.
036900     IF BANKXT01-2-TYPE IS EQUAL TO '2'
037000        PERFORM PRINT-TOTAL-TXNS
037100        MOVE SPACES TO WS-LINE5
037200        MOVE BANKXT01-2-ACC-NO TO WS-LINE5-ACC-NO
037300        MOVE 'Last statement' TO WS-LINE5-DESC-PT1
037400        MOVE BANKXT01-2-ACC-DESC TO WS-LINE5-DESC-PT2
037500        MOVE BANKXT01-2-ACC-LAST-STMT-DTE TO DDI-DATA
037600        SET DD-ENV-NULL TO TRUE
037700        SET DDI-ISO TO TRUE
037800        SET DDO-DD-MMM-YYYY TO TRUE
037900        CALL 'UDATECNV' USING WS-DATE-WORK-AREA
038000        MOVE DDO-DATA TO WS-LINE5-DATE
038100        MOVE BANKXT01-2-ACC-CURR-BAL TO WS-LINE5-BALANCE
038200        ADD BANKXT01-2-ACC-CURR-BAL TO WS-TOTAL-ASSETS
038300        MOVE WS-LINE5 TO PRINTOUT-REC
038400        PERFORM PRINTOUT-PUT
038500     END-IF.
038600     IF BANKXT01-3-TYPE IS EQUAL TO '3'
038700        MOVE SPACES TO WS-LINE5
038800        MOVE BANKXT01-3-DESC TO WS-LINE5-DESC (4:30)
038900        MOVE BANKXT01-3-TIMESTAMP (1:10) TO DDI-DATA
039000        SET DD-ENV-NULL TO TRUE
039100        SET DDI-ISO TO TRUE
039200        SET DDO-DD-MMM-YYYY TO TRUE
039300        CALL 'UDATECNV' USING WS-DATE-WORK-AREA
039400        MOVE DDO-DATA TO WS-LINE5-DATE
039500        MOVE BANKXT01-3-AMOUNT TO WS-LINE5-AMOUNT
039600        ADD BANKXT01-3-AMOUNT TO WS-TOTAL-TXNS
039700        SET TXNS-PRINTED TO TRUE
039800        MOVE WS-LINE5 TO PRINTOUT-REC
039900        PERFORM PRINTOUT-PUT
040000     END-IF.
040100
040200*****************************************************************
040300* Format and print transaction totals                           *
040400*****************************************************************
040500 PRINT-TOTAL-TXNS.
040600     IF TXNS-PRINTED
040700        MOVE SPACES TO WS-LINE5
040800        MOVE '------------' TO WS-LINE5-AMOUNT-DASH
040900        MOVE WS-LINE5 TO PRINTOUT-REC
041000        PERFORM PRINTOUT-PUT
041100        MOVE SPACES TO WS-LINE5-DESC
041200        MOVE 'Total transactions' TO WS-LINE5-DESC (4:30)
041300        MOVE WS-TOTAL-TXNS TO WS-LINE5-AMOUNT
041400        MOVE ZERO TO WS-TOTAL-TXNS
041500        SET NO-TXNS-PRINTED TO TRUE
041600        MOVE WS-LINE5 TO PRINTOUT-REC
041700        PERFORM PRINTOUT-PUT
041800     END-IF.
041900
042000
042100*****************************************************************
042200* Format and print "page" totals                                *
042300*****************************************************************
042400 PRINT-TOTAL-ASSETS.
042500     IF WS-FIRST-REC IS EQUAL TO 'YES'
042600        MOVE 'NO' TO WS-FIRST-REC
042700        SET NO-TXNS-PRINTED TO TRUE
042800     ELSE
042900        MOVE SPACES TO WS-LINE5
043000        MOVE '------------' TO WS-LINE5-BALANCE-DASH
043100        MOVE WS-LINE5 TO PRINTOUT-REC
043200        PERFORM PRINTOUT-PUT
043300        MOVE SPACES TO WS-LINE5
043400        MOVE 'Total Assets' TO WS-LINE5-DESC
043500        MOVE WS-TOTAL-ASSETS TO WS-LINE5-BALANCE
043600        MOVE WS-LINE5 TO PRINTOUT-REC
043700        PERFORM PRINTOUT-PUT
043800     END-IF.
043900
044000*****************************************************************
044100* Open the EXTRACTed data file                                 *
044200*****************************************************************
044300 EXTRACT-OPEN.
           OPEN INPUT EXTRACT-FILE.
044500     IF WS-EXTRACT-STATUS = '00'
044600        MOVE 'EXTRACT file opened OK'
044700          TO WS-CONSOLE-MESSAGE
044800        PERFORM DISPLAY-CONSOLE-MESSAGE
044900     ELSE
045000        MOVE 'EXTRACT file open failure...'
045100          TO WS-CONSOLE-MESSAGE
045200        PERFORM DISPLAY-CONSOLE-MESSAGE
045300        MOVE WS-EXTRACT-STATUS TO WS-IO-STATUS
045400        PERFORM DISPLAY-IO-STATUS
045500        PERFORM ABORT-PROGRAM
045600        END-IF.
045700
045800*****************************************************************
045900* Read a record from the EXTRACTed data file                    *
046000*****************************************************************
046100 EXTRACT-GET.
046200     READ EXTRACT-FILE.
046300     IF WS-EXTRACT-STATUS NOT = '00'
046400        IF WS-EXTRACT-STATUS = '10'
046500           MOVE 'YES' TO WS-END-OF-FILE
046600        ELSE
046700           MOVE 'EXTRACT Error readng file ...'
046800             TO WS-CONSOLE-MESSAGE
046900            PERFORM DISPLAY-CONSOLE-MESSAGE
047000            MOVE WS-EXTRACT-STATUS TO WS-IO-STATUS
047100            PERFORM DISPLAY-IO-STATUS
047200            PERFORM ABORT-PROGRAM
047300        END-IF
047400     END-IF.
047500
047600*****************************************************************
047700* Close the EXTRACTed data file                                 *
047800*****************************************************************
047900 EXTRACT-CLOSE.
048000     CLOSE EXTRACT-FILE.
048100     IF WS-EXTRACT-STATUS = '00'
048200        MOVE 'EXTRACT file closed OK'
048300          TO WS-CONSOLE-MESSAGE
048400        PERFORM DISPLAY-CONSOLE-MESSAGE
048500     ELSE
048600        MOVE 'EXTRACT file close failure...'
048700          TO WS-CONSOLE-MESSAGE
048800        PERFORM DISPLAY-CONSOLE-MESSAGE
048900        MOVE WS-EXTRACT-STATUS TO WS-IO-STATUS
049000        PERFORM DISPLAY-IO-STATUS
049100        PERFORM ABORT-PROGRAM
049200     END-IF.
049300
049400*****************************************************************
049500* Open the seqential print file                                 *
049600*****************************************************************
049700 PRINTOUT-OPEN.

030100     set printout to new 
                   ZFile("//DD:PRINTOUT", "wb,type=record")
           set ps to new PrintStream(printout::getOutputStream,
                                     false, "iso-8859-1")
                                     
           set reptLines to new ArrayList[String]()
           set pdfObj = new PDF("BankPDF2.0_").                      


051200*****************************************************************
051300* Write a record to the squential file                          *
051400*****************************************************************
051500 PRINTOUT-PUT.
           invoke type System::out::println(PRINTOUT-REC)
           IF PRINTOUT-REC IS NOT EQUAL TO SPACE
              
      *       WRITE PRINTOUT-REC
              invoke printout::write(PRINTOUT-REC)
              invoke reptLines::add(PRINTOUT-REC)
              invoke pdfObj::WriteDocumentLine(PRINTOUT-REC)
              set recordBytes to printout-rec
              set cipherString to
                  cryptObject::Encrypt(recordBytes, "mypassword")
              invoke type
                System::out::println("Cipher String: " & cipherString)
              set cryptResult to
                  cryptObject::Decrypt(cipherString, "mypassword")
              set PRINTOUT-REC to cryptResult::ResultMessage
              invoke type 
                System::out::println("Decrypted String: " & 
                                      PRINTOUT-REC
                                    )

052600     END-IF.
052700
052800*****************************************************************
052900* Close the seqential print file                                *
053000*****************************************************************
053100 PRINTOUT-CLOSE.
      *    invoke genObj::close
      *    set genObj to null
           invoke pdfObj::close()
           set pdfObj to null
           try 
               invoke printout::close()
               MOVE 'PRINTOUT file closed Ok' 
                 TO  WS-CONSOLE-MESSAGE               
           catch
               MOVE 'PRINTOUT file close failure' 
                 TO  WS-CONSOLE-MESSAGE
           finally
               PERFORM DISPLAY-CONSOLE-MESSAGE
           end-try.

054500
054600*****************************************************************
054700* Display the file status bytes. This routine will display as   *
054800* two digits if the full two byte file status is numeric. If    *
054900* second byte is non-numeric then it will be treated as a       *
055000* binary number.                                                *
055100*****************************************************************
055200 DISPLAY-IO-STATUS.
055300     IF WS-IO-STATUS NUMERIC
055400        MOVE SPACE TO WS-CONSOLE-MESSAGE
055500        STRING 'File status -' DELIMITED BY SIZE
055600               WS-IO-STATUS DELIMITED BY SIZE
055700          INTO WS-CONSOLE-MESSAGE
055800        PERFORM DISPLAY-CONSOLE-MESSAGE
055900     ELSE
056000        SUBTRACT WS-TWO-BYTES-BINARY FROM WS-TWO-BYTES-BINARY
056100        MOVE WS-IO-STAT2 TO WS-TWO-BYTES-RIGHT
056200        MOVE SPACE TO WS-CONSOLE-MESSAGE
056300        STRING 'File status -' DELIMITED BY SIZE
056400               WS-IO-STAT1 DELIMITED BY SIZE
056500               '/' DELIMITED BY SIZE
056600               WS-TWO-BYTES DELIMITED BY SIZE
056700          INTO WS-CONSOLE-MESSAGE
056800        PERFORM DISPLAY-CONSOLE-MESSAGE
056900     END-IF.
057000
057100*****************************************************************
057200* Expand the 2 character state/prove code to its full text      *
057300*****************************************************************
057400 EXPAND-STATE-PROV.
057500     MOVE 0 TO STATE-PROV-SUB.
057600     DIVIDE LENGTH OF STATE-PROV-DATA (1) INTO
057700       LENGTH OF STATE-PROV-TABLE
057800         GIVING STATE-PROV-COUNT.
057900     MOVE STATE-PROV-WK-CODE TO STATE-PROV-WK-NAME.
058000 EXPAND-STATE-PROV-LOOP.
058100     ADD 1 TO STATE-PROV-SUB.
058200     IF STATE-PROV-SUB IS GREATER THAN STATE-PROV-COUNT
058300        GO TO EXPAND-STATE-PROV-EXIT
058400     END-IF.
058500     IF STATE-PROV-WK-CODE IS EQUAL TO
058600          STATE-PROV-CODE (STATE-PROV-SUB)
058700        MOVE STATE-PROV-NAME (STATE-PROV-SUB) TO
058800          STATE-PROV-WK-NAME
058900        GO TO EXPAND-STATE-PROV-EXIT
059000     END-IF.
059100     GO TO EXPAND-STATE-PROV-LOOP.
059200 EXPAND-STATE-PROV-EXIT.
059300     EXIT.
           
      *GET-LOANAMORT-JAVA.
      *    declare JavaClient = new JVMLoan()
      *    invoke type System::out::println("Before REST call")     
      *    set amortjObj = JavaClient::Amortization(25000, 48, 6.9)
      *    invoke type System::out::println("After REST call")
      *    if amortjObj not = null
      *       perform varying Payitem 
      *         as type com.amcpresales.clients.java.PAYMENT
      *                        thru amortjObj::pAYMENTS
      *           invoke type 
      *            System::out::println
      *             ("Payment: " & Payitem::oUTPAYMENT)
      *           invoke type 
      *            System::out::println("Principal: " & Payitem::
      *            oUTPRINCPAID)
      *           invoke type 
      *            System::out::println
      *             ("Balance: " & Payitem::oUTBALANCE)
      *           invoke type System::out::println("-------------")
      *       end-perform
      *    else
      *        invoke type System::out::println("AmortObj is Null")
      *    end-if.
           
       GET-LOANAMORT-COBOL.
           declare CobJvmClient = new COBJVMLoan()
           invoke type System::out::println("Before REST call")     
           set amortcObj = 
             CobJvmClient::Amortization(PRINCIPAL,LOANTERM,RATE)
           invoke type System::out::println("After REST call")
           if amortcObj not = null
              perform using AmortPDFStatement 
              as type PDF = new PDF("Amort_Quote_")

                set PRINTOUT-REC to
                   "Rocket Software Demo Bank Loan Amortization Quote"
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)      
                
                move spaces to PRINTOUT-REC
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)                                                                                    

                move spaces to PRINTOUT-REC
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Principal: " & type String::valueOf(PRINCIPAL)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Months: " & type String::valueOf(LOANTERM)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Interest Rate: " & type String::valueOf(RATE)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)                                                                                    
              
                invoke type System::out::println(ws-amort-rec-header)
                move ws-amort-rec-header to PRINTOUT-REC
                invoke
                   AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)   
                                                                          
                perform varying Payitem as type PAYMENT
                               thru amortcObj::pAYMENTS
                  
                  set ws-amort-payment to
                    type String::format("%.2f",Payitem::oUTPAYMENT)
                  set ws-amort-principal to
                    type String::format("%.2f",Payitem::oUTPRINCPAID)   
                  set ws-amort-interest to
                    type String::format("%.2f",Payitem::oUTINTPAID)     
                  set ws-amort-balance to
                    type String::format("%.2f",Payitem::oUTBALANCE)     
                  invoke type System::out::println(ws-amort-rec)
                  move ws-amort-rec to PRINTOUT-REC    
                  invoke 
                    AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)  
                end-perform
                set PRINTOUT-REC to "Total Interest Paid: " &
                  type String::format("%.2f",amortcObj::oUTTOTINTPAID)
                  
                invoke type System::out::println(PRINTOUT-REC) 
                invoke
                    AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)  
              end-perform
           else
               invoke type System::out::println("AmortObj is Null")
           end-if.
           
       GET-AWS-LOANAMORT-COBOL.
           declare CobJvmClient = new COBJVMLoan()
           invoke type System::out::println("Before REST call")     
           set AWSAmortObj = 
           CobJvmClient::AmortizationAWS(PRINCIPAL,LOANTERM,RATE true)
           invoke type System::out::println("After REST call")
           if AWSAmortObj not = null
              perform using AmortPDFStatement 
              as type PDF = new PDF("AWS_Amort_Quote_")

                set PRINTOUT-REC to
                   "Rocket Software Demo Bank Loan Amortization " &
                   "Powered by AWS Lambda/COBOLJVM"        
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)      
                
                move spaces to PRINTOUT-REC
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)                                                                                    

                move spaces to PRINTOUT-REC
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Principal: " & type String::valueOf(PRINCIPAL)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Months: " & type String::valueOf(LOANTERM)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)    
                
                set PRINTOUT-REC to
                  "Interest Rate: " & type String::valueOf(RATE)
                invoke 
                  AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)                                                                                    
              
                invoke type System::out::println(ws-amort-rec-header)
                move ws-amort-rec-header to PRINTOUT-REC
                invoke
                   AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)   
                                                                          
                perform varying amortItem as type AmortList 
                           thru AWSamortObj::amortList
                  
                  set ws-amort-payment to amortItem::payment
                  set ws-amort-principal to amortItem::principalPaid
                  set ws-amort-interest to amortItem::interestPaid
                  set ws-amort-balance to amortItem::balance
                  invoke type System::out::println(ws-amort-rec)
                  move ws-amort-rec to PRINTOUT-REC    
                  invoke 
                    AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)  
                end-perform
                set PRINTOUT-REC to "Total Interest Paid: " &
                    AWSamortObj::totalInterest
                  
                invoke type System::out::println(PRINTOUT-REC) 
                invoke
                    AmortPDFStatement::WriteDocumentLine(PRINTOUT-REC)  
              end-perform
           else
               invoke type System::out::println("AmortObj is Null")
           end-if.           
           
059400
059500*****************************************************************
059600* 'ABORT' the program.                                          *
059700* Post a message to the console and issue a goback              *
059800*****************************************************************
059900 ABORT-PROGRAM.
060000     IF WS-CONSOLE-MESSAGE NOT = SPACES
060100        PERFORM DISPLAY-CONSOLE-MESSAGE
060200     END-IF.
060300     MOVE 'Program is abending...'  TO WS-CONSOLE-MESSAGE.
060400     PERFORM DISPLAY-CONSOLE-MESSAGE.
060500* Add some LE routines to identify but dont execute them
060600     IF RETURN-CODE IS NOT EQUAL TO RETURN-CODE
060700        CALL 'CEE3DMP' USING WS-CEE3DMP-DMP-TITLE
060800                             WS-CEE3DMP-DMP-OPTIONS
060900                             WS-CEE3DMP-FEEDBACK
061000        CALL 'CEELOCT' USING WS-CEELOCT-DATE-LILIAN
061100                             WS-CEELOCT-SECS-LILIAN
061200                             WS-CEELOCT-TIME-GREGORIAN
061300                             WS-CEELOCT-FEEDBACK
061400     END-IF.
061500     MOVE 16 TO RETURN-CODE.
061600     GOBACK.
061700
061800*****************************************************************
061900* Display CONSOLE messages...                                   *
062000*****************************************************************
062100 DISPLAY-CONSOLE-MESSAGE.
           invoke type 
             System ::out::println("ZBNKPRT1 - " & 
      -                         WS-CONSOLE-MESSAGE)   

           MOVE ALL SPACES TO WS-CONSOLE-MESSAGE.

001500 RUN-TIME.

001600     IF TIMER-START IS EQUAL TO ZERO
001700        ACCEPT TIMER-START FROM TIME
001800        MOVE 'Timer started' TO WS-CONSOLE-MESSAGE
001900        PERFORM DISPLAY-CONSOLE-MESSAGE
002000     ELSE
002100        ACCEPT TIMER-END FROM TIME
002200        MOVE 'Timer stopped' TO WS-CONSOLE-MESSAGE
002300        PERFORM DISPLAY-CONSOLE-MESSAGE
002400        COMPUTE TIMER-ELAPSED =
002500                  ((TIMER-END-HH * 60 * 60 * 100) +
002600                   (TIMER-END-MM * 60 * 100) +
002700                   (TIMER-END-SS * 100) +
002800                    TIMER-END-DD) -
002900                  ((TIMER-START-HH * 60 * 60 * 100) +
003000                   (TIMER-START-MM * 60 * 100) +
003100                   (TIMER-START-SS * 100) +
003200                    TIMER-START-DD)
003300        MOVE TIMER-ELAPSED-R TO TIMER-RUN-TIME-ELAPSED
003400        MOVE TIMER-RUN-TIME TO WS-CONSOLE-MESSAGE
003500        PERFORM DISPLAY-CONSOLE-MESSAGE
003600     END-IF.
003700
062700
062800* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm