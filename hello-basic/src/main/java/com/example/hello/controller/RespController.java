package com.example.hello.controller;

import com.example.hello.domain.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class RespController {

    @GetMapping("/text")
    public String text(@RequestParam String account){

        return account;

    }

    //req->object mapper ->object -> method ->object-> object mapper-> resq
    @PostMapping("/json")
    public User json(@RequestBody User user){


        return user;
    }

    //ResqonseEntity
    @PutMapping("/put")
    public ResponseEntity<User> put(@RequestBody User user){

       return ResponseEntity.status(HttpStatus.CREATED).body(user);


    }
}
