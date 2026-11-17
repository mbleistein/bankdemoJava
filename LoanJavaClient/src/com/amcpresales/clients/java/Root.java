package com.amcpresales.clients.java;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty; // version 2.11.1

public class Root{
    @JsonProperty("PAYMENTS") 
    public ArrayList<PAYMENT> pAYMENTS;
    @JsonProperty("OUTTOTINTPAID") 
    public double oUTTOTINTPAID;
}
