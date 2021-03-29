package com.example.hello.domain;


import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class CarDTO {

    private String name;

    private String number;
}
