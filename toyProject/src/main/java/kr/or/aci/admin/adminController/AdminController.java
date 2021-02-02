package kr.or.aci.admin.adminController;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.or.aci.admin.domain.AdminDAO;
import kr.or.aci.admin.domain.AdminDTO;

@Controller
@RequestMapping("/admin")
@SessionAttributes("adminSession")
public class AdminController {

	
	@Autowired
	private AdminDAO adminDAO;
	
	
	
	@GetMapping("/adminLogin")
	public String adminSelecter(){
		
	
		
		return "/admin/adminLogin";	
	}
	
	@PostMapping("/loginMap")
	@ResponseBody
	public Map<String,Object>  sortLoginAdmin(@RequestBody Map<String,Object> map,HttpSession session) {

		System.out.println("adminPageLogin:::::::::"+map);


		AdminDTO adminDTO=null;


		try {
			adminDTO=adminDAO.sortLoginAdmin(map);
		
			if(adminDTO!=null) {
				
				session.setAttribute("adminSession", adminDTO.getAdminStatus());
				
				
				session.getAttribute("adminSession");
				
				
				map.put("admin", adminDTO);
				return map;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		map.put("admin", adminDTO);
		return map;
	}
	
	@GetMapping("/adminLogout")
	public String logout(SessionStatus sessionStatus) {
		
		sessionStatus.setComplete();
		

		return "redirect:/main";
		
	}
	
	
}
