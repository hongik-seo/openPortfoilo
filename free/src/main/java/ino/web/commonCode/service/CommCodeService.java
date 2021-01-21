package ino.web.commonCode.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ino.web.freeBoard.dto.FreeBoardDto;

@Service
@Transactional(rollbackFor=Exception.class)
public class CommCodeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	
	public List<HashMap<String, Object>> selectCommonCodeList(Map<String, Object> map) {
		
		
		
		
		return sqlSessionTemplate.selectList("selectCommonCodeList",map);
	}
	
	
	
	public List<HashMap<String, Object>> selectComm(){
		
		
		return sqlSessionTemplate.selectList("selectComm");
	}
	
	 
	public List<HashMap<String, Object>> selectDComm(Map<String,Object> map){
		
		
		return sqlSessionTemplate.selectList("selectDComm",map);
	}

	//@Transactional(timeout=1000)
	public int insertCom(List<Map<String,Object>> list){
		
		System.out.println("service::::::::"+list);
		
		return sqlSessionTemplate.insert("insertCom",list);
	}
	

	//@Transactional(timeout=2000)
	public int updateCom(List<Map<String,Object>> list){
		
		
		return sqlSessionTemplate.update("updateCom",list);
	}
	
	//@Transactional(timeout=1000)
	public int deleteCom(List<Map<String,Object>> list){
		
		
		return sqlSessionTemplate.update("deleteCom",list);
	}
	
	
	
}
