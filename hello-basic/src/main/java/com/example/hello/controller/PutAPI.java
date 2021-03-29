package com.example.hello.controller;

import com.example.hello.domain.QueryDTO;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class PutAPI {

    @PutMapping("/put/{userId}")
    @ResponseBody
    public  QueryDTO put(@RequestBody QueryDTO dto,@PathVariable String userId ){


        System.out.println(dto);

        return dto;
    }



}
