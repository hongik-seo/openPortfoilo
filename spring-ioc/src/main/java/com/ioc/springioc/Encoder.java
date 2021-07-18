package com.ioc.springioc;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.util.Base64;


public class Encoder {


    private IEncoder iEncoder;

   /* public Encoder(@Qualifier("base74Encoder") IEncoder iEncoder){

        this.iEncoder=iEncoder;
    }*/


    public Encoder( IEncoder iEncoder){

        this.iEncoder=iEncoder;
    }

    public String encode(String message){
        return iEncoder.encode(message);
    }

    public void setIEncoder(IEncoder iEncoder){

        this.iEncoder= iEncoder;
    }
}
