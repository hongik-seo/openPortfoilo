package kr.or.aci.join.domain;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinDAO {

	@Autowired
	SqlSessionTemplate sqlsession;
	
	
	public int joinInsert(JoinDTO joinDTO) {
		
		
		return sqlsession.insert("joinInsert",joinDTO);
		
	}
	
	public JoinDTO loginSelect(Map<String,Object> map) {
		
		
		
		
			
		return sqlsession.selectOne("loginSelect",map);
			
	}
	
	public JoinDTO myPageSelect(int id) {
		
		
		
		return sqlsession.selectOne("myPageSelect",id);
	}
			
	
}
