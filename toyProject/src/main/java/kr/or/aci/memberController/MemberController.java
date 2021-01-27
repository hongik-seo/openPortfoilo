package kr.or.aci.memberController;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		mav.addObject("member", mailDTO);
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
	public JoinDTO login(@RequestBody Map<String,Object> frm,HttpServletResponse response){
		
		JoinDTO	login=null;
		
		try {
			login=joinDAO.loginSelect(frm);
			
			System.out.println("login:::::::::::::::::::"+login);
			
			
			if(login!=null) {
				Cookie loginCookie = new Cookie("loginCookie",String.valueOf(login.getId()));

				loginCookie.setPath("/"); 
				
				// 쿠키를 유지할 시간 설정(단위 : 초) 
				loginCookie.setMaxAge(60*60*24*30); // 30일 동안 쿠키 유지. 
				
				response.addCookie(loginCookie); 
				
				return login;

			}
			
			return login;
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
		
		
	
		return login;
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
	
	@GetMapping("/mypage")
	public ModelAndView mypageFront(@CookieValue(value = "loginCookie", required = false) Cookie loginCookie ,RedirectAttributes rttr) {
		
		ModelAndView mav=new ModelAndView();
		
		String cookId=loginCookie.getValue();
		
		int id=Integer.parseInt(cookId);
		
		JoinDTO myPageDTO=joinDAO.myPageSelect(id);
		
		mav.addObject("myPageDTO", myPageDTO);
		
		mav.setViewName("/member/mypage");
		
		
		return mav;
	}
	


}
