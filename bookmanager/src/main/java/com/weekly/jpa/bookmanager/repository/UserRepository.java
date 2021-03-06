package com.weekly.jpa.bookmanager.repository;

import com.weekly.jpa.bookmanager.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;

//쿼리메소드는 필드와 컬럼값으로 매칭 시켜줘야 돌아간다(where 절에 By이후 컬럼값이 들어감), 그렇지 않으면 빈크리에이티드익셉션 발생!!
// ex findByOptional is beanCreatedException
@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    List<User> findFirstByName(String name);

    Set<User> findUserByNameIs(String name);

    Set<User> findUserByName(String name);

    Set<User> findUserByNameEquals(String name);

    Optional<User> findByName(String name);

    User findByEmail(String email);

    User getByEmail(String email);

    User readByEmail(String email);

    User queryByEmail(String email);

    User searchByEmail(String email);

    User streamByEmail(String email);

    User findUserByEmail(String email);

    //BeanCreationException: Error creating bean with name 'userRepository' defined
    //User findByOptional(String email);

    List<User> findFirst2ByName(String name);

    List<User> findTop2ByName(String name);

    //last 정의된 단어가 아니라 무시된다.
    List<User> findLast1ByName(String name);

    List<User> findByEmailAndName(String email, String name);

    List<User> findByEmailOrName(String email, String name);

    List<User> findByCreatedAtAfter(LocalDateTime yesterday);

    List<User> findByIdAfter(Long id);

    List<User> findByCreatedAtGreaterThan(LocalDateTime yesterday);

    List<User> findByCreatedAtGreaterThanEqual(LocalDateTime yesterday);

    List<User> findByCreatedAtBetween(LocalDateTime yesterday, LocalDateTime tomorrow);

    List<User> findByIdBetween(Long id1, Long id2);

    //널값조회
    List<User> findAllByIdIsNotNull();

    //문자의 not empty가 아니라 컬렉션의 notempty
    //List<User> findByAddressesIsNotEmpty();

    List<User> findByNameIn(List<String> names);

    List<User> findByNameStartingWith(String name);

    List<User> findByNameEndingWith(String name);

    List<User> findByNameContains(String name);

    List<User> findByNameLike(String name);

}
