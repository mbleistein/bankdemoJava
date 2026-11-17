package com.amcpresales.clients.java;

import com.fasterxml.jackson.annotation.JsonProperty; // version 2.11.1

public class PAYMENT{
 @JsonProperty("OUTINTPAID") 
 public double oUTINTPAID;
 @JsonProperty("OUTPRINCPAID") 
 public double oUTPRINCPAID;
 @JsonProperty("OUTPAYMENT") 
 public double oUTPAYMENT;
 @JsonProperty("OUTBALANCE") 
 public double oUTBALANCE;
}