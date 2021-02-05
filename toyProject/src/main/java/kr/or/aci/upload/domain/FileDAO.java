package kr.or.aci.upload.domain;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void fileInsert(Map<String,Object> map) {
		
		
		sqlSessionTemplate.insert("fileInsert",map);
		
	}
	
	
	public FileDTO  fileSelect(String orginFileName) {
		
		
		return sqlSessionTemplate.selectOne("fileSelect",orginFileName);
		
	}
	
	
}
