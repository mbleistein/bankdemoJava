      $set ilusing"com.fasterxml.jackson.annotation"
       class-id com.amcpresales.clients.cobol.AmortList public.
       01 payDateNo      String property public
                         attribute JsonProperty("payDateNo").
       01 interestPaid   String property
                         attribute JsonProperty("interestPaid").
       01 principalPaid  String property
                         attribute JsonProperty("principalPaid").
       01 payment        String property
                         attribute JsonProperty("payment").
       01 balance        String property public 
                         attribute JsonProperty("balance").      
       end class.
