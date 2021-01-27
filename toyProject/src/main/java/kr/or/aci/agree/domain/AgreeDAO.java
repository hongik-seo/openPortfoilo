package kr.or.aci.agree.domain;

import java.sql.Timestamp;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Service
public class AgreeDAO  {

	
	@Autowired
	private  SqlSessionTemplate sqlsession; 
	
	
	public int agreeInsert(AgreeDTO dto) {
		
		
		
		return sqlsession.insert("agreeInsert",dto);
		
	}
	

	
	
	
}
