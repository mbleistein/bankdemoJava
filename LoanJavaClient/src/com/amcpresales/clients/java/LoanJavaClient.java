package com.amcpresales.clients.java;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.fasterxml.jackson.databind.ObjectMapper;

public class LoanJavaClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		PAYMENT pObj = new PAYMENT();
		Root rObj = new Root();

        String endpointUrl = "http://localhost:9103/finance/AmortService/1.0/AmortInfo?P=20000&T=36&R=3.5";

        // 1. Instantiate the HTTPClient
        HttpClient client = HttpClient.newHttpClient();

        // 2. Create the HttpRequest object (defaults to GET)
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(endpointUrl))
                .header("Accept", "application/json") // Optional header
                .build();	
        

        try {
            // 3. Send the request and capture the response
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // 4. Handle the response data
            System.out.println("Status Code: " + response.statusCode());
            System.out.println("Response Body: \n" + response.body());
            ObjectMapper objectMapper = new ObjectMapper();     
            
//            User user = objectMapper.readValue(jsonString, User.class);
            rObj = objectMapper.readValue(response.body(),Root.class); 
            System.out.println(rObj);
            
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }        
			

	}

}
