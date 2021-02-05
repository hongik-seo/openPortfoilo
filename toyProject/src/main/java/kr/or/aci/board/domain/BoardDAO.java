package kr.or.aci.board.domain;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int insertBoard(List<Map<String,Object>> list) {
		
		
		
		return sqlSession.insert("insertBoard",list);
	}

	
	public List<BoardDTO> selectBoard(String on) {
		
		
		return sqlSession.selectList("selectBoard", on);
		
	}
	
	
	public int updateBoard(Map<String,Object> map) {
		
		
		return sqlSession.update("updateBoard",map);
	}
	
	
}
