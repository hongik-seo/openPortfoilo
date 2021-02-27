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
  
    	
       
        HashMap<Integer,String> map=new HashMap<Integer, String>();
        int count=0;
        int i=0;

        while(i<phone_book.length) {
    		
        
    		
    		phone_book[i]=sc.nextLine().replaceAll("\\s", "");
    		
    		
    		map.put(i, phone_book[i]);
    		
    		int leng= phone_book[0].length()<=phone_book[i].length()? phone_book[0].length() :phone_book[i].length()  ;
    		
    		
    		
    		String comBook=phone_book[i].substring(0,leng);
    		
    		
    	
    		if(phone_book[0].contains(comBook)) {
    			
    			count++;
    			System.out.println(count);
    	     
    		}
    	
    		
    		i++;
    		
    	}
    	System.out.println(map);
		
    	boolean answer = count > 1 ? false : true;
    	
    	return answer;
    	
    	
    	
    
    }
   
    
}
