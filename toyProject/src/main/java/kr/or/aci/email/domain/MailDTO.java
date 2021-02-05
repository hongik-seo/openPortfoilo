package kr.or.aci.email.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import kr.or.aci.isStatus.domain.IsStatusDAO;
import kr.or.aci.join.domain.JoinDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("MailDTO")
public class MailDTO {

	private int id;
	
	private String mailFrom;

	private String mailTo;

	private String mailSubject;

	private String mailContent;
	
	private Timestamp sendDate;
	
	private Timestamp getDate;
	
	private String emailName;
	
	private String emailKey;
	
	
	
	
	 

}
