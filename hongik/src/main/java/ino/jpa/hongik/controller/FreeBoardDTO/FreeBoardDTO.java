package ino.jpa.hongik.controller.FreeBoardDTO;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class FreeBoardDTO {
	
	private Long num;
	
	private String codeType;
	
	private String name;
	
	private String title;
	
	private String content;
	
	private LocalDateTime regdate;
	
	
	
}
