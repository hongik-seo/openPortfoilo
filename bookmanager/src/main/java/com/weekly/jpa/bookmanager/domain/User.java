package com.weekly.jpa.bookmanager.domain;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;


@Getter
@Setter
@ToString //안 쓸 경우 해쉬코드 값이 찍힌다. 자바의 모든 객체는 Object 하위 객체 이기 때문
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@EqualsAndHashCode
@Builder
@Accessors(chain = true)
public class User {

    @NonNull
    private String name;

    private String email;

    private LocalDateTime createAt;

    private LocalDateTime updateAt;

    /*
    @Override
    public String toString(){
        return getClass().getName()
            + "name=" + name
            + "email="+ email
            + "createAt=" + createAt
            + "updateAt=" + updateAt;

    }
    */

}
