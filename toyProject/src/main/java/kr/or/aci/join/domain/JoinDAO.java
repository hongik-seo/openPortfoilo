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
		
		System.out.println("loginMap::::::::"+map);
		
		
			
		return sqlsession.selectOne("loginSelect",map);
			
	}
	
	public JoinDTO myPageSelect(int id) {
		
		
		
		return sqlsession.selectOne("myPageSelect",id);
	}
			
	public int myPageUpdate(JoinDTO mypageDTO) {
		
		
		return sqlsession.update("myPageUpdate",mypageDTO);
	}
	
	public JoinDTO idPwdFind(Map<String,Object> map) {
		
		
		
		
		
		return sqlsession.selectOne("idPwdFind",map);
			
	}
	
	
	
}
