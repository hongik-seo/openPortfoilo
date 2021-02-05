package kr.or.aci.board.boardController;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.aci.board.domain.BoardDAO;
import kr.or.aci.board.domain.BoardDTO;
import kr.or.aci.upload.domain.FileDTO;
import kr.or.aci.upload.domain.FileUtil;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private FileUtil fileUtil;
	
	
	
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
	public List<Map<String,Object>> insertFrequncy(
			@RequestBody List<Map<String,Object>> list
			
			) {
		
		
		System.out.println("frequncyList::::::::::::::::::::::"+list);
		
		boardDAO.insertBoard(list);
		
		return list;
		
	}
	
	@GetMapping("/adminBoardNoticePage")
	public String adminBoardNoticePage() {
		
		
		
		return "/board/adminBoardNoticePage";
	}
	
	
	
	
	
	@PostMapping("/updateFile")
	public ModelAndView updateFrm(
			@RequestPart(name="boardFileLocation") MultipartFile file,
			@RequestParam(value="boardSubject") String boardSubject,
			@RequestParam(value="boardWriter") String boardWriter,
			@RequestParam(value="boardContent") String boardContent,
			@RequestParam(value="boardKind") String boardKind
			) {
		
		
		ModelAndView mav=new ModelAndView();
		
		Map<String,Object> map=new HashMap<String, Object>();
		List<Map<String,Object>> list=new ArrayList<>();
		
		
		
		String orginFileName = file.getOriginalFilename();
	    
		map.put("boardSubject", boardSubject);
		map.put("boardWriter", boardWriter);
		map.put("boardContent", boardContent);
		map.put("boardKind", boardKind);
		map.put("boardOriFileName", orginFileName);
		list.add(map);
		
		boardDAO.insertBoard(list);
		
		
		
		fileUtil.upLoad(file);
		
		
		
		FileDTO fileDB=fileUtil.selectFile(orginFileName);
	        
		
		map.put("fileDB", fileDB);
		
		    
		
		mav.addObject("file",map);
		
	    mav.setViewName("/board/boardDetail");
	    	
	    return mav;
		
	}

	
	
	
	
	
	
	

	@GetMapping("/questingView")
	public ModelAndView questing(@RequestParam(defaultValue = "0") String on) {
		
		
		System.out.println("너의 이름은???"+on);
		
		ModelAndView mav=new ModelAndView();
		
		
		List<BoardDTO> freqList=boardDAO.selectBoard(on);
		
		
		
		
		mav.addObject("freqList",freqList);
		mav.setViewName("/board/questing");
		
		
		return mav;
	}
	
	@GetMapping("/modify")
	public ModelAndView freqModify(
			@RequestParam(defaultValue = "")String boardKind,
			@RequestParam(defaultValue = "")String boardSubject,
			@RequestParam(defaultValue = "")String boardContent,
			ModelAndView mav
			) {
		
			
			
			mav=new ModelAndView();
			mav.addObject("boardKind",boardKind);
			mav.addObject("boardSubject",boardSubject);

			mav.addObject("boardContent",boardContent);
			
			
			
			
			mav.setViewName("/board/adminBoardModifyPage");
		
		
		return mav;
	}
	
	

	
	
	
	
	
}
