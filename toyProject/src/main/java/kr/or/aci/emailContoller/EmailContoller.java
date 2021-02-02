package kr.or.aci.emailContoller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.aci.email.domain.MailDAO;
import kr.or.aci.email.domain.MailDTO;
import kr.or.aci.email.domain.MailService;

@Controller
@RequestMapping("/email")
public class EmailContoller {

	    
	 @Autowired
	 private MailService mss;
	
	 
	 @Autowired
	 private MailDAO mailDAO;
	 
	 
	
	
	@GetMapping("/confirmYourEmail")
	public Object beforJoinAjax(
			@RequestParam(value="name",required = false)String name,
			@RequestParam(value="email", required = false)String email,
			@RequestParam(value="full", required = false)String full,
			@RequestParam(value="id", required = false)String id
			) {
		
		Map<String,Object> map=new HashMap<String, Object>();
		Timestamp sendDate=Timestamp.valueOf(LocalDateTime.now());
		
		MailDTO mailDTO = new MailDTO();
		mailDTO.setMailFrom("hongcha11@naver.com");
		mailDTO.setMailTo(email);
		mailDTO.setMailSubject("This is Email test.");
		mailDTO.setEmailName(name);


		System.out.println("full:::::::::::::::::::::"+full);
		
		
		if(!full.equals("allFind")) {
			int key = (int) (Math.random() * 45) + 1;
			mailDTO.setMailContent("Learn how to send email using Spring.인증키:"+key);
			mailDTO.setEmailKey(String.valueOf(key));
			mailDTO.setSendDate(sendDate);
			mss.sendEmail(mailDTO);
	        mailDAO.emailSendInsertBeforeJoin(mailDTO);

	        map.put("emailAuten",mailDTO);
	        
	        return map;
		}else if(full.equals("allFind")) {
			
			int key = (int) (Math.random() * 45) + 1;
			
			map.put("id", id);
			map.put("name", name);
			map.put("email",email);
			String pwd=mailDAO.allPwdSendMember(map);
			System.out.println("key::::::::::::"+pwd);
			mailDTO.setMailContent("Learn how to send email using Spring.당신의 비밀번호:"+pwd);
			mailDTO.setSendDate(sendDate);
			
			mss.sendEmail(mailDTO);
			
			String path="redirect:/main";
			
	        return path;
	        
		}
		
        
       
        
        
        return map;
	
        /*AbstractApplicationContext context = new AnnotationConfigApplicationContext(MailConfig.class);

        MailService mailService = (MailService) context.getBean("mailService");
        mailService.sendEmail(mail);
        context.close();
         */
        
	}
	
	
	 
	 
	
	
	
}
