package kr.or.aci.board.domain;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int insertBoard(List<Map<String,Object>> list) {
		
		
		
		return sqlSession.insert("insertBoard",list);
	}

	
	public List<BoardDTO> selectBoard(Map<String,Object> map) {
		
		
		return sqlSession.selectList("selectBoard", map);
		
	}
	
	
	public int updateBoard(Map<String,Object> map) {
		
		
		return sqlSession.update("updateBoard",map);
	}
	
	public List<BoardDTO> selectBoardDetail(Map<String,Integer> map) {
		
		
		return sqlSession.selectList("selectBoardDetail",map);
	}
	
	public int hitNumber(int list) {
		
		
		return sqlSession.update("hitNumber",list);
		
	}
	
	public int total(Map<String,Object> map) {
		
		
		return sqlSession.selectOne("total",map);
		
	}
	
}
