package kr.or.aci.agree.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data
@Alias(value = "AgreeDTO")
public class AgreeDTO {

	private long id;
	
	private String service;
	
	private String privacy;
	
	private Timestamp agreeTime;
	
	private String agreeName;
	
	private int agreeId;
	
}
