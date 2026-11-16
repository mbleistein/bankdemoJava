           EXEC SQL DECLARE
           InterestRate TABLE
           ( RateType              char(1)              NOT NULL
            ,RateTerm              int(10)              NOT NULL
            ,RateDate              datetime(23)         NOT NULL
            ,CurrRate              decimal(18, 3)       NOT NULL
           ) END-EXEC.
      *>  --------------------------------------------------------------
      *> COBOL DECLARATION FOR TABLE InterestRate
      *>  --------------------------------------------------------------
       01  DCLInterestRate.
           03 InterestRate-RateType            PIC X(1).
           03 InterestRate-RateTerm            PIC S9(09)  COMP-5.
           03 InterestRate-RateDate            PIC X(23).
           03 InterestRate-CurrRate            PIC S9(15)V9(03) COMP-3.
