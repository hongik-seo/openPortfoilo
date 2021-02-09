package kr.or.aci.upload.domain;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
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
	
	public void downLoad(HttpServletResponse response,String fileName) throws IOException {
	
	String download="D:\\servelet Eclipse\\eclipse\\workspace\\upload\\"+fileName;
		
	 byte[] fileByte = FileUtils.readFileToByteArray(new File(download));
	 
	 if(fileName.contains(".pdf") ||fileName.contains(".jpg") ||fileName.contains(".png")) {
	 
	 response.getOutputStream().write(fileByte);
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	
	 }else{
		 
		 FileDTO fileDTO =fileDAO.fileSelect(fileName);
		
		 
		 response.setHeader("Content-Disposition",
	                "attachment; filename=\"" + URLEncoder.encode(fileDTO.getOrginFileName(), "UTF-8") + "\"");
		 response.setHeader("Content-Transfer-Encoding", "binary");
		 response.setHeader("Content-Type", "application/octet-stream");
		 response.setHeader("Pragma", "no-cache;");
		 response.setHeader("Expires", "-1;");
	      
		 FileInputStream fis = null;

		 try {

	            File file = new File(fileDTO.getUploadPath()+"\\" + fileDTO.getOrginFileName());
	            fis = new FileInputStream(file);

	            IOUtils.copy(fis, response.getOutputStream());

	        } catch (IOException ioe) {
	            ioe.printStackTrace();
	        } finally {
	            IOUtils.closeQuietly(fis);
	        }
	 
	 }
	
	}
	       
}