package kr.or.aci.board.boardController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.aci.board.domain.BoardDAO;
import kr.or.aci.board.domain.BoardDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardDAO boardDAO;
	
	
	@GetMapping("/adminChoice")
	public String adminWriter() {
		
		
		
		return "/board/adminBoardChoice";
	}
	
	@GetMapping("/adminBoardFrequncyPage")
	public String adminBoardFrequncyPage() {
		
		
		
		return "/board/adminBoardFrequncyPage";
	}
	
	
	
	
	//공지사항 뷰 컨트롤러 만들기
	
	
	@Transactional
	@PostMapping("/insertFrequncy")
	@ResponseBody
	public List<Map<String,Object>> insertFrequncy(@RequestBody List<Map<String,Object>> list) {
		
		
		System.out.println("frequncyList::::::::::::::::::::::"+list);
		
		
		
		
		boardDAO.insertFrequncy(list);
		
		return list;
		
	}
	
	@GetMapping("/questingView")
	
	public ModelAndView questing(@RequestParam(defaultValue = "0") String on) {
		
		
		System.out.println("너의 패스밸리어블은 ????????"+on);
		
		ModelAndView mav=new ModelAndView();
		
		
		List<BoardDTO> freqList=boardDAO.selectFrequncy(on);
		
		
		
		
		mav.addObject("freqList",freqList);
		mav.setViewName("/board/questing");
		
		
		return mav;
	}
	
	
	
	
	
	
}
