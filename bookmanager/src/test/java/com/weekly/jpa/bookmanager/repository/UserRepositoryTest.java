package com.weekly.jpa.bookmanager.repository;

import com.weekly.jpa.bookmanager.domain.User;
import org.assertj.core.util.Lists;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers.endsWith;

@SpringBootTest
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;


    @Test
    //@Transactional
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

        /*
        userRepository.save(new User("new martin", "newMartin@test.com"));

        userRepository.flush();


        userRepository.findAll().forEach(x -> {
            System.out.println(x);
        });
        */

        /*
        long count =userRepository.count();

        System.out.println(count);

        */

        /*
        boolean exists=userRepository.existsById(1L);

        System.out.println(exists);
        */


        //userRepository.delete(userRepository.findById(1L).orElse(null));

        //userRepository.deleteById(1L);

        //userRepository.deleteAll(userRepository.findAllById(Lists.newArrayList(5L,3L)));

        /*
        Page<User> users=userRepository.findAll(PageRequest.of(1,3));//인덱스 0부터 시작

        System.out.println(users);
        System.out.println(users.getTotalElements());
        System.out.println(users.getTotalPages());
        System.out.println(users.getNumberOfElements());
        System.out.println(users.getSort());
        System.out.println(users.getSize());
        users.getContent().forEach(x-> System.out.println(x));
         */



    }

    @Test
    void queryByExample(){

        ExampleMatcher matcher= ExampleMatcher.matching()
                .withIgnorePaths("name")
                .withMatcher("email",endsWith());

        Example<User> example=Example.of(new User("ma","test"),matcher);

        userRepository.findAll(example).forEach(x-> System.out.println(x));

    }


    @Test
    void update(){

        userRepository.save(new User("david","david@test.com"));

        User user=userRepository.findById(1L).orElseThrow(null);

        user.setEmail("martin-updated@test.com");

        userRepository.save(user);


    }

    @Test
    void select(){

        System.out.println("findFirstByName"+userRepository.findFirstByName("martine"));

        System.out.println("findByName"+userRepository.findByName("dennis"));

        System.out.println("findByEmail" + userRepository.findByEmail("test@test.com"));

        System.out.println("getByEmail" + userRepository.getByEmail("test@test.com"));

        System.out.println("readByEmail" + userRepository.readByEmail("test@test.com"));

        System.out.println("queryByEmail" + userRepository.queryByEmail("test@test.com"));

        System.out.println("searchByEmail" + userRepository.searchByEmail("test@test.com"));

        System.out.println("streamByEmail" + userRepository.streamByEmail("test@test.com"));

        System.out.println("findUserByEmail" + userRepository.findUserByEmail("test@test.com"));

        //BeanCreationException: Error creating bean with name 'userRepository' defined
        //System.out.println("findByOptional"+ userRepository.findByOptional("test@test.com"));

        //limit 키워드가 붙음
        System.out.println("findFirst2ByName" + userRepository.findFirst2ByName("martine"));

        System.out.println("findTop2ByName" + userRepository.findTop2ByName("martine"));

        System.out.println("findLast1ByName"+userRepository.findLast1ByName("martine"));
    }

}