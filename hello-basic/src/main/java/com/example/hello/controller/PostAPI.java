package com.example.hello.controller;

import com.example.hello.domain.QueryDTO;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class PostAPI {


    @PostMapping("/post")
    @ResponseBody
    public void post(@RequestBody Map<String,Object> reqData){

        reqData.entrySet().forEach(stringObjectEntry -> {

            System.out.println("key"+ stringObjectEntry.getKey());

            System.out.println("value"+stringObjectEntry.getValue());

        });


    }

    @PostMapping("/post/dto")
    @ResponseBody
    public void post(@RequestBody QueryDTO dto){


        System.out.println(dto);

    }
}
