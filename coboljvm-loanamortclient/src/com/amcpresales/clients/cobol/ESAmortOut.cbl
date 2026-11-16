      $set ilusing"com.fasterxml.jackson.annotation"
      $set ilusing"java.util"

       class-id com.amcpresales.clients.cobol.ESAmortOut public.
       01 pAYMENTS type ArrayList[type PAYMENT] property public
                     attribute JsonProperty("PAYMENTS").
       01 oUTTOTINTPAID float-short property public
                     attribute JsonProperty("OUTTOTINTPAID").

       end class.


      *