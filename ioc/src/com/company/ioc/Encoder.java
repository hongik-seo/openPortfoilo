package com.company.ioc;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class Encoder {

    private IEncoder iEncoder;

    public Encoder(IEncoder iEncoder){
       this.iEncoder=iEncoder;
    }

    public String encode(String massage){

        return Base64.getEncoder().encodeToString(massage.getBytes());
    }

}
