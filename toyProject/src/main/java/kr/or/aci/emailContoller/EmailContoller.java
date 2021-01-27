package kr.or.aci.emailContoller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public Map<String,Object> beforJoinAjax(
			@RequestParam(value="name",required = false)String name,
			@RequestParam(value="email", required = false)String email
			) {
		
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		int key = (int) (Math.random() * 45) + 1;
		
		
		Timestamp sendDate=Timestamp.valueOf(LocalDateTime.now());
		
		MailDTO mailDTO = new MailDTO();
		mailDTO.setMailFrom("hongcha11@naver.com");
		mailDTO.setMailTo(email);
		mailDTO.setMailSubject("This is Email test.");
		mailDTO.setMailContent("Learn how to send email using Spring.인증키:"+key);
		mailDTO.setEmailName(name);
		mailDTO.setSendDate(sendDate);
		mailDTO.setEmailKey(key);
		
		
        mss.sendEmail(mailDTO);
        
        
        mailDAO.emailSendInsertBeforeJoin(mailDTO);
       
        map.put("emailAuten",mailDTO);
        
        
        return map;
	
        /*AbstractApplicationContext context = new AnnotationConfigApplicationContext(MailConfig.class);

        MailService mailService = (MailService) context.getBean("mailService");
        mailService.sendEmail(mail);
        context.close();
         */
        
	}
	
	
	 
	 
	
	
	
}
