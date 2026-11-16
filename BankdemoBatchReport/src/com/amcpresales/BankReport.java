package com.amcpresales;

import com.rocketsoftware.jzos.*;
import com.amcpresales.bankdemo.*;

class BankReport {
    public static void run() {
        try {
            // Explicitly map Java standard streams to JCL DDs when not using JVMLDM.
            ZUtil.redirectStandardStreams("iso-8859-1", true);
//            java.lang.System.setProperty(ZUtil.JZOS_MERGE_SYSOUT_PROPERTY, "true");

            
            System.out.println("Bank Statement Report with ZBNKPRT1");
            System.out.println("Java version: " + System.getProperty("java.version"));
            System.out.println("Working directory: " + System.getProperty("user.dir"));
            String parmString = System.getenv("BNKPRTPARMS");
             
        	ZBNKPRT1 zbj = new ZBNKPRT1();
        	String[] parms = parmString.split(",");
        	zbj.ZBNKPRT1(parms);

        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            e.printStackTrace(System.err);
        } finally {
            ZUtil.restoreStandardStreams();
        }
    }
}
