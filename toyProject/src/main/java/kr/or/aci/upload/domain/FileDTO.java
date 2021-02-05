package kr.or.aci.upload.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Alias("FileDTO")
@Accessors(chain = true)
public class FileDTO {

	private int id;  
	private String orginFileName;  
	private String storedFileName; 
	private Timestamp regDate; 
	private Timestamp delDate; 
	private String uploadPath;
	
	
}
