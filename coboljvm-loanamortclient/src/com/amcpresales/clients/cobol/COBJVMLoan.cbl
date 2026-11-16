      $set sourceformat"variable"
      $set ilusing"java.io.IOException"
      $set ilusing"java.net"
      $set ilusing"java.net.http"
      $set ilusing"com.amcpresales.clients.cobol"      
      $set ilusing"com.fasterxml.jackson.databind"

      ******* AWS SDK Imports
      $set ilusing"software.amazon.awssdk.core"
      $set ilusing"software.amazon.awssdk.regions"
      $set ilusing"software.amazon.awssdk.services.lambda"
      $set ilusing"software.amazon.awssdk.services.lambda.model"

       class-id com.amcpresales.clients.cobol.COBJVMLoan public.
       *> This is a test method not being used yet
       method-id AmortAWSHttp (pNum as binary-long tNum as binary-long rNum as float-short)
                 returning rObj as type AWSAmortOut public.
       
       procedure division.
    
           declare restParms = Type Integer::toString(PNum) & "&T="
                               & Type Integer::toString(tNum)
                               & "&R=" & Type Float::toString(rNum)
           
           declare endpointUrl = "https://rclnaejts8.execute-api.us-east-1.amazonaws.com/mbdefaultstage"
           declare client = type HttpClient::newHttpClient()
           declare jsonPayload =  '{"principal": 39000, "term": 36,"rate":5.99}' 
           declare publisher = type java.net.http.HttpRequest+BodyPublishers::ofString(jsonPayload)
           declare request = type HttpRequest::newBuilder()
           ::uri(type URI::create(endpointUrl))
           ::header("Accept", "application/json")
           ::POST(publisher)
           ::build()
           
           try
               declare response = client::send(request, type HttpResponse+BodyHandlers::ofString())
               invoke type System::out::println("Status Code: " & response::statusCode())
               invoke type System::out::println("Response Body: ");
               invoke type System::out::println(response::body());                
               declare objectMapper = new ObjectMapper();   
               set rObj to objectMapper::readValue(response::body(), type of AWSAmortOut);
           catch
               invoke type System::out::println(exception-object::getMessage())
           end-try
           goback.
       end method.

       method-id Amortization (pNum as binary-long tNum as binary-long rNum as float-short)
                 returning rObj as type ESAmortOut.
       
       
       procedure division.
           declare restParms = Type Integer::toString(PNum) & "&T="
                               & Type Integer::toString(tNum)
                               & "&R=" & Type Float::toString(rNum)
           
           declare endpointUrl = "http://localhost:9103/finance/AmortService/1.0/AmortInfo?P=" & restParms
           declare client = type HttpClient::newHttpClient()

           declare request = type HttpRequest::newBuilder()
           ::uri(type URI::create(endpointUrl))
           ::header("Content-Type", "application/json")
           ::build()
           
           try
               declare response = client::send(request, type HttpResponse+BodyHandlers::ofString())
               invoke type System::out::println("Status Code: " & response::statusCode())
               invoke type System::out::println("Response Body: ");
               invoke type System::out::println(response::body());                
               declare objectMapper = new ObjectMapper();   
               set rObj to objectMapper::readValue(response::body(), type of ESAmortOut);
           catch
               invoke type System::out::println(exception-object::getMessage())
           end-try
           goback.
       end method.
      
       method-id AmortizationAWS (pNum as binary-long, tNum as binary-long, rNum as float-short, http as condition-value = true)
                 returning rObj as type AWSAmortOut.
       01 payload type SdkBytes.
       01 jasonPayload String.
       01 functionName String.
       01 lambdaClient type LambdaClient.
       01 response type InvokeResponse.
       01 request type InvokeRequest.

           if http
               declare endpointUrl = "https://rclnaejts8.execute-api.us-east-1.amazonaws.com/mbdefaultstage/loanamortLambda"
               declare client = type HttpClient::newHttpClient()
      *        declare jsonPayload =  '{"principal": 39000, "term": 36,"rate":5.99}' 
               declare jsonPayload = 
                          "{" & 
                            '"principal"'
                            & ":" & type
                            Integer::toString(pNum)  & ","
                            & '"term"' & ":" & type 
                            Integer::toString(tNum) & ","
                            & '"rate"' & ":" & type Float::toString(rNum) 
                          & "}"
                                                              
               declare publisher = type java.net.http.HttpRequest+BodyPublishers::ofString(jsonPayload)
               declare request = type HttpRequest::newBuilder()
               ::uri(type URI::create(endpointUrl))
               ::header("Content-Type", "application/json")
               ::POST(publisher)
               ::build()

               try
                   declare response = client::send(request, type HttpResponse+BodyHandlers::ofString())
                   invoke type System::out::println("Status Code: " & response::statusCode())
                   invoke type System::out::println("Response Body: ");
                   invoke type System::out::println(response::body());                
                   declare objectMapper = new ObjectMapper();   
                   set rObj to objectMapper::readValue(response::body(), type of AWSAmortOut);
               catch
                   invoke type System::out::println(exception-object::getMessage())
               end-try
           end-if
           goback.

       end method.  
    
       end class.
