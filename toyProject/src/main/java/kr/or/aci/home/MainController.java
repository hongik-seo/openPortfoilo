package kr.or.aci.home;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes("adminSession")
public class MainController {

	
	@GetMapping(value="/main")	
	public ModelAndView main(@CookieValue(value = "loginCookie", required = false) Cookie loginCookie,
			 HttpSession adminSession) {
		
		
		ModelAndView mav=new ModelAndView();
		if(loginCookie != null) { //cookieValue 변수에 쿠키 값을 저장한다. 
			String loginCookieValue = loginCookie.getValue();
			
			
			System.out.println("cookieVal:::::::::::::::"+loginCookieValue);
			mav.addObject("loginCookie",loginCookieValue);
		
		}
		
		
		String session=(String)adminSession.getAttribute("adminSession");
		
		System.out.println("mainsession::::::::::::::::::"+session);	
		

		mav.setViewName("/main/index");
			
		
		
		return mav;
	}
	
	
	
	
	
	
}
