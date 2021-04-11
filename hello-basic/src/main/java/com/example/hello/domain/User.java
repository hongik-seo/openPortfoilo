package com.example.hello.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@JsonNaming(value = PropertyNamingStrategy.SnakeCaseStrategy.class)
@JsonInclude(JsonInclude.Include.NON_NULL)//non_null은 포함한다 -> null은 포함하지 않는다
@Accessors(chain = true)
public class User {

     private String name;
     private int age;
     @JsonProperty(value = "phone_number")
     private String phoneNumber;
     private String address;

     //만약 오브젝트 맵퍼를 활용할시 get메소드가 아닌 다른 생정자에 get을 붙이면 오류가 발생
     //왜냐면 오브젝트 맵퍼는 get메소드를 사용하기 때문

     public User defualt(){

          return new User(null,0,null,null);

     }

}
