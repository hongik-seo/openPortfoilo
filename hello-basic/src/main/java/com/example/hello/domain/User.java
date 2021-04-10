package com.example.hello.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;


@Data
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
}
