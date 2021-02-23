package programmers;
/*

import java.util.Scanner;
import java.util.TreeMap;

public class Maraton {

	
	public static void main(String[] args) {
		
		
		Solution solution=new Solution();
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("몇명이 참여 했나요?");
		int length=sc.nextInt();
		
		if(length>0 || length<100000) {

			
			String[] participant=new String[length];

			if(length>0) {

				String[] completion=new String[length-1];

				System.out.println("탈락자"+solution.solution(participant, completion));;

			}
		}
		
		
		
	}
	
	
	
}




class Solution {
    public String solution(String[] participant, String[] completion) {
        TreeMap<Integer,String> tree=new TreeMap<>();
    	Scanner sc=new Scanner(System.in);
    	String answer = "";
    	String fail="";
    	for(int i=0; i<participant.length; i++) {
    		
    		participant[i]=sc.next();
        	
    		fail=tree.put(i, participant[i]);
    	
    		System.out.print("참여자");
    		System.out.println(tree);
    		
    	}
    	
    	int ran=(int)(Math.random()*completion.length);
    	
    	answer=tree.put(ran, fail);
    	
    	
    	
    	
        return answer;
    }
}*/