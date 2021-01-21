package ino.jpa.hongik.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ino.jpa.hongik.controller.FreeBoardDTO.FreeBoardDTO;
import ino.jpa.hongik.domain.FreeBoardEntity;

public interface FreeBoardDtoRepository extends JpaRepository<FreeBoardEntity, Long> {

	
		
		 @Query(value = "SELECT num.nextval FROM dual", nativeQuery = true)
		 public Long getNextValMySequence();
		
		
		@Query(value="SELECT * FROM freeboard f WHERE f.title LIKE %?1%",
		countQuery = "SELECT COUNT(f.num) FROM freeboard f WHERE f.title LIKE %?1%",
		nativeQuery=true		 
				 )
		public Page<FreeBoardEntity> searchByTitleLike(@Param(value = "keyword") String keyword,Pageable pageable);
		
		
		@Query(value="SELECT * FROM freeboard f WHERE f.num LIKE %?1%",
				countQuery = "SELECT COUNT(f.num) FROM freeboard f WHERE f.num LIKE %?1%",
				nativeQuery=true		 
						 )
		public Page<FreeBoardEntity> searchByNumLike(@Param(value = "keyword") String keyword,Pageable pageable);
		
		

}