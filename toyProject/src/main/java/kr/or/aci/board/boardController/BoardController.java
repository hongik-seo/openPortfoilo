package kr.or.aci.board.boardController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
import kr.or.aci.board.domain.PageDTO;
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
		
		
		
		return "/admin/adminBoardChoice";
	}
	
	@GetMapping("/adminBoardFrequncyPage")
	public String adminBoardFrequncyPage() {
		
		
		
		return "/admin/adminBoardFrequncyPage";
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
		
		
		
		return "/admin/adminBoardNoticePage";
	}
	
	
	
	
	
	@PostMapping("/updateFile")
	public ModelAndView updateFrm(
			@RequestPart(name="boardOriFileName") MultipartFile file,
			@RequestParam(value="boardSubject") String boardSubject,
			@RequestParam(value="boardWriter") String boardWriter,
			@RequestParam(value="boardContent") String boardContent,
			@RequestParam(value="boardKind") String boardKind
			) throws IOException {
		
		
		ModelAndView mav=new ModelAndView();
		
		Map<String,Object> map=new HashMap<String, Object>();
		List<Map<String,Object>> list=new ArrayList<>();
		
		
		
		String orginFileName = file.getOriginalFilename();
	    
		System.out.println("orginFileName:::::::::::::"+orginFileName);
		
		map.put("boardSubject", boardSubject);
		map.put("boardWriter", boardWriter);
		map.put("boardContent", boardContent);
		map.put("boardKind", boardKind);
		map.put("boardOriFileName", orginFileName);
		list.add(map);
		
		boardDAO.insertBoard(list);
		
		
		fileUtil.upLoad(file);
	
		
	    mav.setViewName("/admin/adminBoardNoticePage");
	    	
	    return mav;
		
	}

	
	

	@GetMapping("/questingView")
	public ModelAndView questing(@RequestParam(defaultValue = "0") String on) {
		
		
		System.out.println("너의 이름은???"+on);
		
		ModelAndView mav=new ModelAndView();
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		map.put("on", on);
		
		List<BoardDTO> freqList=boardDAO.selectBoard(map);
		
		
		
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
			
			
			
			
			mav.setViewName("/admin/adminBoardModifyPage");
		
		
		return mav;
	}
	
	
	@GetMapping("/boardList")
	public ModelAndView boardList(@RequestParam(value="on") String on, 
			@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "10") int amount,
			Model model) {
		
		System.out.println(pageNum);
		System.out.println(amount);
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		List<PageDTO> pageList=new ArrayList<PageDTO>();
		
		
		ModelAndView mav=new ModelAndView();
	
		map.put("on", on);
		
	
		int total=boardDAO.total(map);
		
		

		PageDTO pageMark =new PageDTO(pageNum, amount, total);
		
		
		
		int offSet = (pageMark.getPageNum()-1)*amount ;
		
		int retotal=(int)Math.floor(total%amount);
		
		
		
		map.put("retotal",retotal);
		
		map.put("pageOffset", offSet);
		
		map.put("cri", pageMark);
		
		mav.addObject("pageMark",pageMark);
		
		List<BoardDTO> list=boardDAO.selectBoard(map);
		
		pageList.add(pageMark);
		
		
		
		
		
		
		mav.addObject(pageList);
		
		System.out.println("mav......................."+mav);
		
		mav.addObject("list",list);
		
		mav.setViewName("/board/shortNoticeList");
		return mav;
	}
	
	@GetMapping("/noticeBoardDetail")
	public String noticeBoardDetail(
			@RequestParam (value="list") int list,
			@RequestParam (value="index") int index,
			@RequestParam(value="prev",required = false) int prev,
			@RequestParam(value ="next",required = false) int next,
		
			Model model) {
		
		
		
		System.out.println("prev"+prev);

		System.out.println("next"+next);
		

		Map<String,Integer> map=new HashMap<String, Integer>();
		

		boardDAO.hitNumber(list);
		
		
		
		
		map.put("list", list);
		
		map.put("prev", prev);
		
		map.put("next", next);
		
		
		

		List<BoardDTO> noticeDetail=boardDAO.selectBoardDetail(map);
		
		
		
		

		model.addAttribute("prev",prev);

		model.addAttribute("next",next);
		
		model.addAttribute("list",list);
		model.addAttribute("noticeDetail",noticeDetail);
		
		model.addAttribute("index",index);
		
		return "/board/noticeBoardDetail";
	}
	
	
	@PostMapping("/download")
	public void download(
			
			@RequestParam("file") String fileName,
			HttpServletResponse response
			) throws IOException {
		
		
		fileUtil.downLoad(response, fileName);
		
		
	}
	
	
	
	
}
