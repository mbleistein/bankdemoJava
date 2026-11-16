      $set ilusing"com.fasterxml.jackson.annotation"

       class-id com.amcpresales.clients.cobol.PAYMENT public.
       01 oUTINTPAID float-short property public
                     attribute JsonProperty("OUTINTPAID").
       01 oUTPRINCPAID float-short property public
                     attribute JsonProperty("OUTPRINCPAID").
       01 oUTPAYMENT float-short property public
                     attribute JsonProperty("OUTPAYMENT").
       01 oUTBALANCE float-short property public
                     attribute JsonProperty("OUTBALANCE").
       end class.


      *