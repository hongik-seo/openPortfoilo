package com.example.hello.controller;

import com.example.hello.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/page")
public class PageController {


    @RequestMapping("/main")
    public String main(){

        return "main.html";
    }

    //ResponseEntity


    @ResponseBody
    @GetMapping("/user")
    public User user(User user){

        user.setAddress("abc").setAge(10).setName("steve").setPhoneNumber("abc");

        return  user;
    }



}
