package com.example.hello.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class DeleteAPI {


    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable String id,@RequestParam String account){

        System.out.println("id"+id);

        System.out.println("account"+account);


    }



}
