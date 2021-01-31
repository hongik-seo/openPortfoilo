package kr.or.aci.isStatus.domain;

import java.sql.Timestamp;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

@Service
public class IsStatusDAO {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	
	public void join(Map<String,Object> map) {
		
		
		
		sqlSession.insert("join",map);
	}
	
	
	public void update(Map<String,Object> map) {
		
		
		
		sqlSession.insert("myPage",map);
	}
	

	public void delete(Map<String,Object> map) {
		
		
		
		sqlSession.insert("delete",map);
	}
	
}
