package kr.or.aci.board.domain;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Accessors(chain = true)
@Alias("BoardDTO")
public class BoardDTO {

	

	private int id; //int AI PK 
	
	private String boardWriter; //varchar(100) 
	
	private String boardSubject; //varchar(200) 
	
	private String boardContent; //varchar(5000) 
	
	private String boardKind; //int 
	
	private int boardHitNumber; //int 
	
	private String boardOriFileName; //varchar(400)
	
	private Timestamp boardWriterDate; //date 
	
	private Timestamp boardUpdateDate; //date 
	
	private Timestamp boardDeleteDate; //date 

	private String boardStatus;
	
	
	
	
	
}
