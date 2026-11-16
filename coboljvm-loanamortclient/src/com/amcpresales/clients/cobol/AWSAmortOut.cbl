      $set ilusing"com.fasterxml.jackson.annotation"
      $set ilusing"java.util"

       class-id com.amcpresales.clients.cobol.AWSAmortOut public.

       01 amortList type ArrayList[type AmortList] property public
                         attribute JsonProperty("amortList").

       01 totalInterest String property public
                         attribute JsonProperty("totalInterest").

       end class.


      *