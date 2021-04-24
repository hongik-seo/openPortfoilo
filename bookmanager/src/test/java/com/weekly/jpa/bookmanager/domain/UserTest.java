package com.weekly.jpa.bookmanager.domain;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    @Test
    void Test(){
    User user=new User();
    user.setEmail("martin@test.com");
    user.setName("martin");

    System.out.println(":::::::" +user);

    }
}