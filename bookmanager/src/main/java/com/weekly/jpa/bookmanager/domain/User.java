package com.weekly.jpa.bookmanager.domain;
import lombok.*;
import lombok.experimental.Accessors;
import javax.persistence.*;
import java.sql.Timestamp;
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
@Entity
//@SequenceGenerator(sequenceName = "TEST_SEQUENCE", name = "userTest" , allocationSize = 1)
public class User {

    //@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "userTest")
    @Id
    @GeneratedValue
    private Long id;

    @NonNull
    private String name;
    @NonNull
    private String email;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

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
