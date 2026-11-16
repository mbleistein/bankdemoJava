      *
      * Simple demonstration of calling a Java class from COBOL.
      * The Java class BankReportrun() is invoked using the
      * Enterprise Server Java interoperability mechanism.
      *
       procedure division.
           display "COBOL: About to Load Java Support."      
           call "Java.com.amcpresales.BankReport.run"
           display "COBOL: Java call succeeded."
           goback
           .
