package com.amcpresales.clients.java;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JVMLoan {
	
	public com.amcpresales.clients.java.Root Amortization(int P, int T, float R)
	{
		Root rObj = new Root();
		
        String restParms = Integer.toString(P) + "&T=" + Integer.toString(T) + "&R=" + Float.toString(R);
        String endpointUrl = "http://localhost:9103/finance/AmortService/1.0/AmortInfo?P=" + restParms;
        HttpClient client = HttpClient.newHttpClient();

        // 2. Create the HttpRequest GET object 
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(endpointUrl))
                .header("Accept", "application/json") 
                .build();	
        
        try {
            // 3. Send the request and capture the response
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // 4. Handle the response data
            System.out.println("Status Code: " + response.statusCode());
            System.out.println("Response Body: \n" + response.body());
            ObjectMapper objectMapper = new ObjectMapper();     
            
            rObj = objectMapper.readValue(response.body(),Root.class); 
            
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }        		
			
		return rObj;
	}

}
