package kr.or.aci.admin.domain;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public AdminDTO sortLoginAdmin(Map<String,Object> map) {
		
		
		
		return sqlSession.selectOne("sortLoginAdmin",map);
	}
	
	

}
