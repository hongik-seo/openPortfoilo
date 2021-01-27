package kr.or.aci.join.domain;

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
@Alias("JoinDTO")
@Accessors(chain = true)
public class JoinDTO {

	
	private int id;
	
	private String joinName;
	
	private String joinId;
	
	private String joinPassword;
	
	private String joinPasswordConfirm;
		
	private String joinBirthday;
	
	private String joinZipCode;
	
	private String joinAddress;
	
	private String joinAddressDetail;
	
	private String joinAddressAppendix;
	
	private String joinNewsletter;
	
	private String joinUseYN;
	
	private String joinEmail;
	
	private String joinPhoneNumber;
	
	
	
	
	
	
	
	
	
	
	
}
