package programmers;

import java.util.HashMap;
import java.util.Scanner;




public class PhoneBook {

	public static void main(String[] args) {
		
		Solution2 s=new Solution2();
		Scanner sc=new Scanner(System.in);
		
		System.out.println("전화 번호는의 개수는?");
		
		int num=sc.nextInt();
		
		String[] phone_book=new String[num];
		
		System.out.println(s.solution(phone_book));;
	
	
	}
	
}

class Solution2 {
	
	
    public boolean solution(String[] phone_book) {
    	
    	Scanner sc=new Scanner(System.in);
        int count=0;
       
        HashMap<Integer,String> map=new HashMap<Integer, String>();
        
    	for(int i=0; i<phone_book.length; i++) {
    		
    		
    		phone_book[i]=sc.nextLine().replaceAll("\\s", "");
    		
    		
    		map.put(i, phone_book[i]);
    		
    		int leng= phone_book[0].length()<phone_book[i].length()? phone_book[0].length() :phone_book[i].length()  ;
    		
    		
    		String comBook=(phone_book[i]).substring(0,leng);
    		
    		
    	
    		if((phone_book[0]).equals(comBook)) {
    			
    	        count++;
   
    	     
    		}
    	
    		
    	
    	}
    	System.out.println(map);
		
    	boolean answer = count>1?false:true;
    	
    	return answer;
    	
    	
    	
    
    }
   
    
}
