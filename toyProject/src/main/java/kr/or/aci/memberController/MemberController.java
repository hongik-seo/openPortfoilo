package kr.or.aci.memberController;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.aci.agree.domain.AgreeDAO;
import kr.or.aci.agree.domain.AgreeDTO;
import kr.or.aci.email.domain.MailDAO;
import kr.or.aci.email.domain.MailDTO;
import kr.or.aci.isStatus.domain.IsStatusDAO;
import kr.or.aci.join.domain.JoinDAO;
import kr.or.aci.join.domain.JoinDTO;






@Controller
@RequestMapping("/member")
public class MemberController {


	@Autowired
	private MailDAO mailDAO;

	@Autowired
	private AgreeDAO agreeDAO;

	@Autowired
	private JoinDAO joinDAO;
	
	@Autowired
	private IsStatusDAO isDAO;

	@GetMapping("/agree")
	public String agree() {

		System.out.println("agree");


		return "/member/agree";
	}
	
	@GetMapping("/agreeParam")
	@ResponseBody
	public Map<String,AgreeDTO> agreeParam(
			@RequestParam(defaultValue = "")String service,
			@RequestParam(defaultValue = "")String privacy
			) {

		Timestamp agreeTime=Timestamp.valueOf(LocalDateTime.now());
		
		AgreeDTO dto =new AgreeDTO();
		
		Map<String,AgreeDTO> map=new HashMap<String, AgreeDTO>();
		
		dto.setPrivacy(privacy);
		dto.setService(service);
		dto.setAgreeTime(agreeTime);

		agreeDAO.agreeInsert(dto);
		
		map.put("data", dto);


		return map;
	}

	
	
	@GetMapping("/showYourInfoBeforeJoin")
	public String showYourInfo() {

		



		return "/member/showYourInfoBeforeJoin";
	}
	

	


	@GetMapping("/inputYourEmail")
	public String inputInfo() {

		


		return "/member/inputYourEmail";
	}




	@PostMapping(value = "/finYourEmail" ,produces = "text/plain; charset=UTF-8")
	public ModelAndView finYourInfo(
			@ModelAttribute("EmailDTO") MailDTO mailDTO
			
			) {

		System.out.println(mailDTO);
		
		
		
		ModelAndView mav=new ModelAndView();
	
		
		
		mav.addObject("key",mailDTO);
		mav.setViewName("/member/finYourEmail");

		
		
		return mav;

	}


	@PostMapping("/inputUserInfo")
	public ModelAndView inputUserInfo(@ModelAttribute("EmailDTO") MailDTO mailDTO) {

		ModelAndView mav=new ModelAndView();
		System.out.println("finEmailBtn click:::::::::::::::::::::::");
		
		Timestamp getDate=Timestamp.valueOf(LocalDateTime.now());
		
		System.out.println(mailDTO);
		mailDTO.setGetDate(getDate);
		
		mailDAO.updateGetDate(mailDTO);

		
		System.out.println(mailDTO);
		
		mav.addObject("mailDTO", mailDTO);
		mav.setViewName("/member/inputUserInfo");
		return mav;
	}
	
	@PostMapping(value="/memberBefore",produces = "text/plain; charset=UTF-8")
	public ModelAndView memberBefore(@ModelAttribute JoinDTO joinDTO) {
		
		System.out.println("memberBefore");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		Timestamp isJoinDate =Timestamp.valueOf(LocalDateTime.now());
		
		System.out.println("joinDTO:::::::::::::::::"+joinDTO);
		
		joinDTO.setJoinUseYN("Y");
		
		
		joinDAO.joinInsert(joinDTO);
		
	
		
		map.put("isJoinDate", isJoinDate);
		
		map.put("isCurrentStatus", joinDTO.getJoinUseYN());
		
		map.put("isMemberId", joinDTO.getJoinId());
		
		isDAO.join(map);
		
		
		mav.addObject("join",joinDTO);
		mav.setViewName("/member/joinFin");
	
		return mav;
	}
	
	
	@GetMapping("/login")
	public String loginView() {
		
		
		
		return "/member/login";
	}
	
	
	
	@PostMapping(value="/loginMap")
	@ResponseBody
	public Map<String,Object> login(@RequestBody Map<String,Object> frm,HttpServletResponse response){
		
		JoinDTO	login=null;
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		System.out.println(frm);
		
		try {
			login=joinDAO.loginSelect(frm);
			
			
			
			Cookie loginCookie = new Cookie("loginCookie",String.valueOf(login.getId()));

			loginCookie.setPath("/"); 
			
			// 쿠키를 유지할 시간 설정(단위 : 초) 
			loginCookie.setMaxAge(60*60*24*30); // 30일 동안 쿠키 유지. 
			
			response.addCookie(loginCookie); 
			
			System.out.println(login);
			
			
			map.put("login", login);
			
			return map;
			
			
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		
		map.put("login", login);
		return map;
	}
	
	@GetMapping("/logout")
	public String logout(@CookieValue(value = "loginCookie", required = false) Cookie loginCookie,HttpServletResponse response) {
		
		loginCookie.setMaxAge(0);
		
		loginCookie.setPath("/"); 
			
			// 쿠키를 유지할 시간 설정(단위 : 초) 
			 // 30일 동안 쿠키 유지. 
			
		response.addCookie(loginCookie); 

		return "redirect:/main";
		
	}
	
	@GetMapping("/selectMyMember")
	public ModelAndView mypageFront(@CookieValue(value = "loginCookie", required = false) Cookie loginCookie ) {
		
		ModelAndView mav=new ModelAndView();
		
		String cookId=loginCookie.getValue();
		
		int id=Integer.parseInt(cookId);
		
		JoinDTO myPageDTO=joinDAO.myPageSelect(id);
		
		mav.addObject("myPageDTO", myPageDTO);
		
		mav.setViewName("/member/showMyInfo");
		
		
		return mav;
	}
	
	
	@GetMapping("/updateMyPage")
	public String updateMyPage(@CookieValue(value = "loginCookie", required = false) Cookie loginCookie,Model model) {

		
		String cookId=loginCookie.getValue();
		
		int id=Integer.parseInt(cookId);
		
		JoinDTO myPageDTO=joinDAO.myPageSelect(id);
		
		model.addAttribute("myPageDTO",myPageDTO);
		
		
		return "/member/inputUserInfo";
	}

	
	@PostMapping("/updateMyMember")
	public String myPageUpdate(@CookieValue(value = "loginCookie", required = false) 
	Cookie loginCookie,@ModelAttribute("JoinDTO") JoinDTO myPageDTO,
	HttpServletResponse response,
	Model model
			) {
		
		
		Timestamp isUpdateDate =Timestamp.valueOf(LocalDateTime.now());
		Map<String, Object> map=new HashMap<String, Object>();
		
		System.out.println(myPageDTO);
		
		map.put("id", loginCookie.getValue());
		
		map.put("isUpdateDate", isUpdateDate);
		
		
		System.out.println("useYN::::::::::::::" + myPageDTO.getJoinUseYN());
		

		
		if(myPageDTO.getJoinUseYN().equals("Y")) {
		
			isDAO.update(map);
		
		
		}else if(myPageDTO.getJoinUseYN().equals("N")) {
			
			
			isDAO.delete(map);
			
			loginCookie.setMaxAge(0);
			
			loginCookie.setPath("/"); 
				
				// 쿠키를 유지할 시간 설정(단위 : 초) 
				 // 30일 동안 쿠키 유지. 
				
			response.addCookie(loginCookie); 
		
			
		}

		
		joinDAO.myPageUpdate(myPageDTO);

		return "redirect:/main";
		
	}
	
	
	@GetMapping("/idPwdfind")
	public String idPwdfind() {
		
		
		
		return "/member/idPwdFind";
	}
	
	@PostMapping("/idPwdfindIsPresent")
	@ResponseBody
	public Map<String,Object> idPwdfindIsPresent(@RequestBody Map<String,Object> map) {
		
		Map<String,Object> findMap=new HashMap<String, Object>();
		JoinDTO find=null;

			System.out.println("find::::::::::::::"+map);
		
		try {

			find=joinDAO.idPwdFind(map);

			findMap.put("find", find);
		} catch (Exception e) {
			// TODO: handle exception
		}

		findMap.put("find", find);

		return findMap;
	}
	
	
	
	
	
	

}
