package kr.or.aci.admin.domain;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTmp;
	
	
	public AdminDTO adminLogin(Map<String,Object> map) {
		
		
		System.out.println("serviceMap::::::::::::::::::"+map);
		
	
		
		return sqlSessionTmp.selectOne("adminLogin",map);
	
	
	}
	

}
