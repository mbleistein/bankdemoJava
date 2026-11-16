      $set cicsecm
       identification division.
       program-id. TESTTIME.

       environment division.
       configuration section.

       data division.
       working-storage section.
       01  ws-resp                      pic s9(9) comp.
       01  WS-CICS-DATE-TIME.
           10 WS-CICS-ABSTIME           PIC X(8).
           10 WS-CICS-DATE              PIC X(10).
           10 FILLER         REDEFINES  WS-CICS-DATE.
              15 WS-CICS-YYYY           PIC X(4).
              15 WS-CICS-MOTH           PIC X(2).
              15 WS-CICS-DAY            PIC X(2).
              15 FILLER                 PIC X(2).
           10 WS-CICS-TIME              PIC X(8).
           10 FILLER         REDEFINES  WS-CICS-TIME.
              15 WS-CICS-HH             PIC X(2).
              15 WS-CICS-MM             PIC X(2).
              15 WS-CICS-SS             PIC X(2).
              15 FILLER                 PIC X(2).
           10 WS-CICS-SECONDS           PIC S9(8)  COMP.
           10 WS-CICS-MS-DIS            PIC 9(8).
           10 FILLER         REDEFINES  WS-CICS-MS-DIS.
              15 FILLER                 PIC 9(5).
              15 WS-CICS-MS             PIC 9(3).

       01  ws-text                      pic x(50).

       procedure division.
       
           EXEC CICS ASKTIME    ABSTIME (WS-CICS-ABSTIME)
                                RESP(WS-RESP)
           END-EXEC
           
           EXEC CICS FORMATTIME ABSTIME (WS-CICS-ABSTIME)
                               YYYYMMDD (WS-CICS-DATE)
                                   TIME (WS-CICS-TIME)
                           MILLISECONDS (WS-CICS-SECONDS)
                                   RESP (WS-RESP)
           END-EXEC

           move spaces to ws-text
           string "CICS DATE=" delimited by size
                  ws-cics-date delimited by size
               into ws-text
           end-string
           EXEC CICS WRITE OPERATOR TEXT(WS-TEXT)
           END-EXEC 

           move spaces to ws-cics-date
           accept ws-cics-date from date

           move spaces to ws-text
           string "COBOL DATE=" ws-cics-date
              into ws-text
           end-string

           EXEC CICS WRITE OPERATOR TEXT(WS-TEXT)
           END-EXEC

           goback.
           
       end program TESTTIME.
