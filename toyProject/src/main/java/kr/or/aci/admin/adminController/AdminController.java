package kr.or.aci.admin.adminController;

import java.util.HashMap;
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
	
	@PostMapping("/adminLoginMap")
	@ResponseBody
	public Map<String,AdminDTO>  sortLoginAdmin(@RequestBody Map<String,Object> map,HttpSession session) {

		System.out.println("adminPageLogin:::::::::"+map);
		Map<String,AdminDTO> loginMap=new HashMap<String, AdminDTO>();

		AdminDTO adminDTO=null;


		try {
			adminDTO=adminDAO.adminLogin(map);
		
			System.out.println("adminDTO"+adminDTO);
			
			if(adminDTO!=null) {
				
				session.setAttribute("adminSession", adminDTO.getAdminStatus());
				
				
				session.getAttribute("adminSession");
				
				
				loginMap.put("admin", adminDTO);
				return loginMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		loginMap.put("admin", adminDTO);
		return loginMap;
	}
	
	@GetMapping("/adminLogout")
	public String logout(SessionStatus sessionStatus) {
		
		sessionStatus.setComplete();
		

		return "redirect:/main";
		
	}
	
	
}
