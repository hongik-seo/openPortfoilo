package kr.or.aci.admin.domain;

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
@Accessors(chain = true)
@Alias("AdminDTO")
public class AdminDTO {
	
	private int id; //int AI PK 
	
	private String adminId; //varchar(100) 
	
	private String adminPassword; //varchar(100) 
	
	private Timestamp adminCreateTime; //date 
	
	private Timestamp adminUpdateTime; //date 
	
	private Timestamp adminDeleteTime; //date 
	
	private int adminPart; //int 
	
	private String adminUseYN; //varchar(10) 
	
	private String adminEmail; //varchar(45) 
	
	private String adminName; //varchar(45)
	
	private String adminStatus;

}
