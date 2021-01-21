package ino.web.freeBoard.service;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.FreeBoardDto;

@Service
public class FreeBoardService   {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	

	public List<FreeBoardDto> freeBoardList(Map<String,Object> map){
		
		
		
		
		
		return sqlSessionTemplate.selectList("freeBoardGetList",map);
		
	}
	
	
	public int freeBoardInsertPro(FreeBoardDto dto){
		
		
	
		
			
		 return sqlSessionTemplate.insert("freeBoardInsertPro",dto);
	}
	
	
	
	
	public FreeBoardDto getDetailByNum(int num){
		
		return sqlSessionTemplate.selectOne("freeBoardDetailByNum", num);
	}
	
	
	
	public int getNewNum(Map<String,Object>	map){
		
		return sqlSessionTemplate.selectOne("freeBoardNewNum",map);
	}
	
	
	public int freeBoardModify(FreeBoardDto dto)  {
	
					
		
		
		return sqlSessionTemplate.update("freeBoardModify",dto);
			
	}
		

	public int FreeBoardDelete (int num) {
	
		
		return sqlSessionTemplate.delete("freeBoardDelete", num);
		
	}


	
	
	
}
