package ino.web.commonCode.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ino.web.commonCode.service.CommCodeService;

@Controller
public class CommCodeController {


	
   @Autowired 
   private CommCodeService commCodeService;
   
   @RequestMapping("/commonCode.ino")
   public ModelAndView commonCode(){
      
      ModelAndView mav = new ModelAndView();
      
      List<HashMap<String,Object>> list =commCodeService.selectComm();
      
      mav.addObject("list" , list);
      mav.setViewName("commonCodeMain");
      
      return mav;
   }
 
   @RequestMapping("/commonCodeDetail.ino")
   public  ModelAndView commDetail(
		   @RequestParam(defaultValue="")String num
		   ){
	   ModelAndView mav = new ModelAndView();
	   Map<String,Object> map=new HashMap<>();
	   
	   System.out.println("num::::::::::::::::"+num);
	   
	   map.put("code", num);
	   
	   List<HashMap<String, Object>>  list=commCodeService.selectDComm(map);
	   
	  // List<Map<String, Object>> newList=new ArrayList<HashMap<String,Object>>();
	   
	   System.out.println("list::::::::::::::::::::"+list);
	   
	   if(list.isEmpty()==true){
		   
		   map.put("defualt", num); 
		   
		   
	   }
	   
	   
	   map.put("list", list);
	   mav.addObject("list" , map);
	   mav.setViewName("commonCodeDetail");
	   
	   return mav;
   }
   
   
   
   
   @RequestMapping(value="/commCodeInsertPro.ino",method=RequestMethod.POST)
   @ResponseBody
   @Transactional(rollbackFor=Exception.class)
   public List<Map<String,Object>> commInsert (
		  
		   @RequestBody List<Map<String,Object>> allArr
		   
		   ) throws Exception {


	   System.out.println("json:::::::::"+allArr);
	   
	   
	  
	   List<Map<String,Object>> ilist=new ArrayList<>();
	   
	   List<Map<String,Object>> ulist=new ArrayList<>();
	   
	   List<Map<String,Object>> dlist=new ArrayList<>();
	   
	   
	   
	   for(int i=0; i<allArr.size(); i++){
		   
		   if(allArr.get(i).containsKey("iCode")){
			   
			  
			   Map<String,Object> iCode= allArr.get(i);
			   
			   ilist.add(iCode);
			   
			  
			   
		   }
		 
	   
		   if(allArr.get(i).containsKey("dCode")){

			   Map<String,Object> dCode= allArr.get(i);
			   
			   dlist.add(dCode);
			
		
		   }
		   
		   if(allArr.get(i).containsKey("uCode")){
			   
			   
			   Map<String,Object> uCode= allArr.get(i);
			   
			   ulist.add(uCode);
			  
			  
		   }
		   
		   
	   }
			   
		   try {
			
		   
				   if(ilist.isEmpty()==false){
				   
					   commCodeService.insertCom(ilist);
					   
				   }
				   
				   if(dlist.isEmpty()==false){
				   
					   commCodeService.deleteCom(dlist);
				   }
				   
				   if(ulist.isEmpty()==false){
				   		
					   commCodeService.updateCom(ulist);
					   
				   }
	
		   } catch (Exception e) {
				// TODO: handle exception
		}
		
	return allArr;

   }

   
}
