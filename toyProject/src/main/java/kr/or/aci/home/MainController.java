package kr.or.aci.home;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {

	
	@GetMapping(value="/main")	
	public ModelAndView main(@CookieValue(value = "loginCookie", required = false) Cookie cookie) {
		
		
		ModelAndView mav=new ModelAndView();
		if(cookie != null) { //cookieValue 변수에 쿠키 값을 저장한다. 
			String cookieValue = cookie.getValue();
		
			System.out.println("cookieVal:::::::::::::::"+cookieValue);
			mav.addObject("cookie",cookieValue);
			
			
			
			
		}

		mav.setViewName("/main/index");
			
		
		
		return mav;
	}
	
	
	
	
	
	
}
