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
	
	
	public int insertFrequncy(List<Map<String,Object>> list) {
		
		
		
		return sqlSession.insert("insertFrequncy",list);
	}

	
	public List<BoardDTO> selectFrequncy(String on) {
		
		
		return sqlSession.selectList("selectFrequncy", on);
		
	}
	
	
}
