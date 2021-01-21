package ino.jpa.hongik.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.data.domain.Pageable;

import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Accessors(chain = true)
@Table(name="freeboard")



@SequenceGenerator(
		  name = "numSeq", 
		  sequenceName = "NUM", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1,
		  allocationSize = 1)

public class FreeBoardEntity {

	@Id
	@NotNull
	@GeneratedValue(strategy =GenerationType.SEQUENCE,
            generator = "numSeq")
	private Long num;
	
	private String codeType;
	
	private String name;
	
	private String title;
	
	private String content;
	
	private LocalDateTime regdate;
	
	
}
