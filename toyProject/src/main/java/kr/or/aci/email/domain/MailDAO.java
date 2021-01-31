package kr.or.aci.email.domain;

import java.sql.Timestamp;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int emailSendInsertBeforeJoin(MailDTO mailDTO) {
		
		
		return sqlSession.insert("emailSendInsertBeforeJoin",mailDTO);
	}
	
	
	public int seleteEmailId(MailDTO mailDTO) {
		
		
		
		return sqlSession.selectOne("seleteEmailId",mailDTO);
		
	}
	
	
	public int updateGetDate(MailDTO mailDTO) {
		
		
		return sqlSession.update("updateGetDate",mailDTO);
	}
	
	public int prevJoinPlaceHolder(MailDTO mailDTO) {
		
		
		
		return sqlSession.selectOne("prevJoinPlaceHolder", mailDTO);
		
	}
	
	public String allPwdSendMember(Map<String,Object> map){
		
		
		return sqlSession.selectOne("allPwdSendMember",map);
		
	}
	
}
