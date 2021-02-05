package kr.or.aci.upload.domain;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUtil {
	
	@Autowired
	private FileDAO fileDAO;
	
	public void upLoad(MultipartFile file) {
		
		String uploadPath="D:\\servelet Eclipse\\eclipse\\workspace\\upload";
		
		String orginFileName = file.getOriginalFilename();
		
		File target = new File(uploadPath, orginFileName);
		
		Map<String,Object> map=new HashMap<String, Object>();
		  
        //경로 생성
        if ( ! new File(uploadPath).exists()) {
            new File(uploadPath).mkdirs();
        }
        //파일 복사
        try {
        	
    	    
        	 String uid = UUID.randomUUID().toString().replaceAll("-", "");
    		 //randonUUID난수화 시킨 해쉬값 (중복될 수 없음)
    		 String storedFileName = uid + "_" +orginFileName;
    		 
    		 
    		 map.put("uploadPath", uploadPath);
	    	 map.put("orginFileName", orginFileName);
	    	 map.put("storedFileName", storedFileName);
	    	 
	    	 fileDAO.fileInsert(map);


	    	 FileCopyUtils.copy(file.getBytes(), target);
            
            
            
            
        	
        } catch(Exception e) {
            e.printStackTrace();
        }
		
	}
	
	public FileDTO selectFile(String orginFileName) {
		
		
		
		return fileDAO.fileSelect(orginFileName);
		
	}
	
	

}