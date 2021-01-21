package ino.jpa.hongik.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ino.jpa.hongik.domain.FreeBoardEntity;
import ino.jpa.hongik.service.FreeBoardService;

@Controller
@RequestMapping("/api")
public class HelloWorldController {
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@GetMapping("/main")
    public String helloWorld(Model model,@PageableDefault(size = 10)  Pageable pageable) {
	   
		
		Page<FreeBoardEntity> list=freeBoardService.mainList(pageable);
		
		
		model.addAttribute("boardList",list);
		
		return "main";
    }
	
	
	@GetMapping("/insert")
	public String insert() {
		
		return "insert";
	}
	
	@GetMapping("/insertPro")
	@ResponseBody
	public Map<String,Object> insertPro(Model model,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "")String content ,
			@RequestParam(defaultValue = "") String name,
			@RequestParam(defaultValue = "") String codeType
			
			) {
		


		Map<String,Object> map=new HashMap<String, Object>();
		System.out.println("title"+title);
		
		FreeBoardEntity insert=freeBoardService.insertList(title,content,name,codeType);
		
		
		model.addAttribute(insert);
		
		
		map.put("insert", model);
		
		System.out.println("map::::::::::::"+map);
		
		return map;
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam(name = "num", value="num", required = false) Long num,Model model) {
		
		System.out.println("num::::::::::::"+num);
		
		
		FreeBoardEntity detailEntity=freeBoardService.detail(num);
		
		model.addAttribute("detail",detailEntity);
		
		System.out.println("model:::::::::::"+model);
		
		return "detail";	
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,FreeBoardEntity> update(@RequestBody Map<String,Object> updateMap) {
		
		Map<String,FreeBoardEntity> returnMap=new HashMap<String, FreeBoardEntity>();
		
		System.out.println("form:::::::::::"+updateMap);
		
		FreeBoardEntity updateEnt=freeBoardService.update(updateMap);
		
		returnMap.put("update", updateEnt);
		
		return returnMap;
		
	}
	
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String,Long> delete(@RequestParam(name="num",value="num",required = false) Long num) {
		
		Map<String,Long> map=new HashMap<String, Long>();
		
		System.out.println(num);
		
		freeBoardService.delete(num);
		
		
		map.put("delete", num);
		
		return map;
	}
	
	@GetMapping("/search")
	@ResponseBody
	public Page<FreeBoardEntity> search(
			@RequestParam(name ="option",value="option", required = false) String option,
			@RequestParam(name="keyword",value="keyword", required = false) String keyword,
			@PageableDefault(size=10) Pageable pageable
			
			){
		//Map<String,FreeBoardEntity> map=new HashMap<>();
		
		
		System.out.println(option);
		
		System.out.println(keyword);
		
		
		Page<FreeBoardEntity> list=freeBoardService.search(option, keyword,pageable);
		
		
		return list;
	}
	
	
	
}
