package com.example.hello;

import com.example.hello.domain.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HelloApplicationTests {

    @Test
    void contextLoads() throws JsonProcessingException {

        System.out.println("hello");

        ObjectMapper objectMapper =new ObjectMapper();

        //object -> text
        //object mapper get method를 활용한다
        User user=new User("steve",10,"01011112222","abc");

        String text=objectMapper.writeValueAsString(user);
        System.out.println(text);

        //text-> object
        //object 디폴트 생성자가 있어야함

        User objectUser=objectMapper.readValue(text,User.class);
        System.out.println(objectUser);
    }

}
