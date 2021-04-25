package com.weekly.jpa.bookmanager.repository;

import com.weekly.jpa.bookmanager.domain.User;
import org.assertj.core.util.Lists;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;


    @Test
    @Transactional
    void crud(){

        //  userRepository.save(new User());
        //  userRepository.findAll().forEach(x-> System.out.println(x));
        //  List<User> users= userRepository.findAll(Sort.by(Sort.Direction.DESC,"name"));
        //  List<User> users= userRepository.findAllById(Lists.newArrayList(1L,3L,5L));


        //User user1=new User("jack","jack@test.com");
        //User user2=new User("steve","steve@steve.com");
        //userRepository.saveAll(Lists.newArrayList(user1,user2));

        //List<User> users=userRepository.findAll();
        //users.forEach(System.out::println);

        //User user=userRepository.getOne(1L);//세션 에러나기 때문에 @Transactional 붙여야함 //기본적으로 레이지 구동
        //System.out.println(user);

       // Optional<User> user=userRepository.findById(1L); //Optional로만 반환==User user2=userRepository.findById(1L).orElse(null);
    }

}