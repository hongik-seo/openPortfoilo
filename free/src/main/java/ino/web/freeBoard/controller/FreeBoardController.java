package ino.web.freeBoard.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ino.web.commonCode.service.CommCodeService;
import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.PageDto;
import ino.web.freeBoard.service.FreeBoardService;




@Controller
public class FreeBoardController  {


	

	@Autowired
	private FreeBoardService freeBoardService;

	@Autowired
	private CommCodeService commCodeService;
	

	@RequestMapping(value="/main.ino", method=RequestMethod.GET)
	public ModelAndView  main (
			
			@RequestParam(defaultValue="") String startDate,
			@RequestParam(defaultValue="") String endDate,
			@RequestParam(defaultValue="") String  option, 
			@RequestParam(defaultValue="") 	Object keyword,
			@RequestParam(defaultValue="1")int pageNum,
			@RequestParam(defaultValue="10") int amount
			)  {

		ModelAndView mav=new ModelAndView();
		
	
		
		Map<String,Object>	map=new HashMap<>();

		
		
		
		map.put("code", "COM002" );
		map.put("option", option);
		map.put("keyword", keyword);
		
		map.put("useyn", 'Y');
		
		List<HashMap<String, Object>>  yearList=commCodeService.selectCommonCodeList(map);

			
		map.put("code", "COM087");
		
		map.put("useyn", 'Y');
	
		
		List<HashMap<String, Object>>  commList=commCodeService.selectCommonCodeList(map);
		
		
		map.put("yearList", yearList);
		
		map.put("commList", commList);
		
		map.put("startDate", startDate);
		
		map.put("endDate", endDate);
		
		
		
		int total=freeBoardService.getNewNum(map);
		

		PageDto pageDto=new PageDto(pageNum,amount,total);
		
		
		
		map.put("pageMaker", pageDto);
		
		

		List<FreeBoardDto> list=freeBoardService.freeBoardList(map);

		map.put("list", list);
		
		
		mav.addObject("list",map);
		mav.setViewName("boardMain");

		return  mav;
	}


	@RequestMapping(value="/search.ino" ,method=RequestMethod.GET)
	@ResponseBody
	public  Map<String,Object> searchMain (
			@RequestParam(defaultValue="") String startDate,
			@RequestParam(defaultValue="") String endDate,
			
			@RequestParam(defaultValue="")  String option, 
			@RequestParam(defaultValue="") 	Object keyword,
			@RequestParam(defaultValue="1")int pageNum,
			@RequestParam(defaultValue="10")int amount)   {




		Map<String,Object> map=new HashMap<>();
		
		
		
	
		System.out.println("start::::"+startDate);
		System.out.println("enddddddd::::"+endDate);
		

		
		map.put("code", "COM002" );
		map.put("option", option);
		map.put("keyword", keyword);
		
		map.put("useyn", 'Y');
		
		List<HashMap<String, Object>>  yearList=commCodeService.selectCommonCodeList(map);

			
		map.put("code", "COM087");
		
		map.put("useyn", 'Y');
	
		
		List<HashMap<String, Object>>  commList=commCodeService.selectCommonCodeList(map);

		map.put("yearList", yearList);
		
		map.put("commList", commList);
		
		

		map.put("startDate", startDate);
		
		map.put("endDate", endDate);

	
		
		int total=freeBoardService.getNewNum(map);
		System.out.println("!!!!!!!!!!!!!!!!!"+endDate);
		
		

		
		PageDto pageDto=new PageDto(pageNum,amount,total);
		
		map.put("pageMaker", pageDto);
		
		
		
		
		List<FreeBoardDto> list=freeBoardService.freeBoardList(map);
		
		map.put("list", list);

		


		return  map;
	}


	@RequestMapping("/freeBoardInsert.ino")
	public Map<String,Object> FreeBoardInsert (@RequestParam(defaultValue="") String codeType){
		System.out.println("insert()");
		
		
		Map<String,Object> map=new HashMap<>(); 

		map.put("code", "COM890" );
		
		map.put("useyn", 'Y');
		
		List<HashMap<String, Object>>  commList=commCodeService.selectCommonCodeList(map);

		map.put("commList", commList);

		
		return map;
	}


	@RequestMapping(value="/freeBoardInsertPro.ino",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> freeBoardInsertPro( FreeBoardDto dto){
		System.out.println("insertPro()");
		System.out.println("insert codetype::::::"+dto.getCodeType());
		System.out.println("insert num:::::::"+dto.getNum());
		System.out.println("insert title:::::::"+dto.getTitle());
		System.out.println("insert content:::::::"+dto.getContent());
		System.out.println("insert name:::::::"+dto.getName());
		System.out.println("insert read:::::::"+dto.getReadcnt());
		System.out.println("insert date:::::::"+dto.getRegdate());


		

		Map<String,Object> map=new HashMap<>(); 
		
		
		try {

			
			
			
			int cnt = freeBoardService.freeBoardInsertPro(dto);
			if(cnt>0){
				map.put("freeBoardDto", dto);
			
				map.put("resultStr", "success");
			}else{
				
				map.put("resultStr", "fail");
				
			}
			
		} catch (Exception e) {

			map.put("resultStr", "fail");
			
		}

		return map;
		//"redirect:freeBoardDetail.ino?num="+dto.getNum();
	}
	
	
	
	

	


	@RequestMapping("/freeBoardDetail.ino")
	
	public ModelAndView freeBoardDetail(FreeBoardDto dto,@RequestParam(name="num") int num){

		num=dto.getNum();
		
		
		FreeBoardDto freeBoardDto=freeBoardService.getDetailByNum(num);


		return new ModelAndView("freeBoardDetail", "freeBoardDto",freeBoardDto);
	}


	

	
	@RequestMapping(value="/freeBoardModify.ino",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object>  freeBoardModifyAjax(FreeBoardDto dto,Exception e) {

		System.out.println("modifyAjax()");
		System.out.println("num::::"+dto.getNum());
		System.out.println("title::::"+dto.getTitle());
		System.out.println("content::::"+dto.getContent());
		System.out.println("read"+dto.getReadcnt());
		System.out.println("reg"+dto.getRegdate());
		System.out.println("codetype"+dto.getCodeType());	
		
		Map<String,Object> map=new HashMap<>(); 
		
		
		try {

			
			int cnt = freeBoardService.freeBoardModify(dto);
			if(cnt>0){
				
				
				map.put("resultStr", "success");
				map.put("dto",dto);
			}else{
				
				map.put("resultStr", "fail");
				
			}
			
		} catch (Exception e2) {

			map.put("resultStr", "fail");
			
		}

		return map;
		
	}



	
		
	


	@RequestMapping("/freeBoardDelete.ino")
	@ResponseBody
	public int FreeBoardDelete(@RequestParam(name="num") int num){
		System.out.println("delete()");
		
		
		return freeBoardService.FreeBoardDelete(num);
		
		
	}


	


	
	
	
	
	
	
	
	
	
	
	
	
}