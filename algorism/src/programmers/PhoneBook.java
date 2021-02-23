package programmers;

import java.util.HashMap;
import java.util.Scanner;




public class PhoneBook {

	public static void main(String[] args) {
		
		Solution sol=new Solution();
		Scanner sc=new Scanner(System.in);
		
		System.out.println("전화번호 목록 갯수");
		
		int num=sc.nextInt();
		
		String[] phone_book=new String[num];
		
		System.out.println(sol.solution(phone_book));;
	
	
	}
	
}

class Solution {
	
	
    public boolean solution(String[] phone_book) {
    	
    	Scanner sc=new Scanner(System.in);
  
    	boolean answer=true;
       
        HashMap<Integer,String> map=new HashMap<Integer, String>();
        
    	for(int i=0; i<phone_book.length; i++) {
    		
    		
    		phone_book[i]=sc.nextLine().replaceAll("\\s", "");
    		
    		
    		map.put(i, phone_book[i]);
    		
    		int leng= phone_book[0].length()<phone_book[i].length()? phone_book[0].length() :phone_book[i].length()  ;
    		
    		
    		String comBook=(phone_book[i]).substring(0,leng);
    		
    		
    	
    		if((phone_book[0]).equals(comBook)) {
    			
    	        
    			answer=false;
    	     
    		}
    	
    		
    	
    	}
    	System.out.println(map);
		
    	
    	
    	return answer;
    	
    	
    	
    
    }
   
    
}
