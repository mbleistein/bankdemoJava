package com.amcpresales;

import com.rocketsoftware.jzos.*;

import java.util.ArrayList;

import com.amcpresales.*;

class CreateBankPDF {
    public static void run() {
        int bytesRead = 0;
        String printRecord = "";
    	try {
            // Explicitly map Java standard streams to JCL DDs when not using JVMLDM.
            ZUtil.redirectStandardStreams("iso-8859-1", true);
//            java.lang.System.setProperty(ZUtil.JZOS_MERGE_SYSOUT_PROPERTY, "true");

            
            System.out.println("Bank Statement Report with ZBNKPRT1");
            System.out.println("Java version: " + System.getProperty("java.version"));
            System.out.println("Working directory: " + System.getProperty("user.dir"));
            String pdfPrefix = System.getenv("STATEMENT_PREFIX");
            String pdfFont = System.getenv("STATEMENT_FONT");            
            ArrayList<String> replines = new ArrayList<>();
            ZFile extract = new ZFile("//DD:PRINTOUT", "rb,type=record");
            byte[] record = new byte[extract.getLrecl()];
            while ((bytesRead = extract.read(record)) >=0)
            {
                printRecord = new String(record);
                replines.add(printRecord);            	
            };
            extract.close();
            PDF pdfDoc = new PDF(pdfPrefix, Integer.parseInt(pdfFont));
            pdfDoc.WritePDF(replines);
            pdfDoc.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            e.printStackTrace(System.err);
        } finally {
            ZUtil.restoreStandardStreams();
        }
    }
}
