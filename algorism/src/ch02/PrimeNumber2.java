package ch02;

import java.util.ArrayList;
import java.util.HashMap;

public class PrimeNumber2 {

	
	public static void main(String[] args) {
		
		int counter=0;
		int prime=2;
		ArrayList<Integer> list=new ArrayList<Integer>();
		ArrayList<Integer> primeList=new ArrayList<Integer>();
		
		for(int i=2; i<=1000; i++) {
			
			
			
			for(int j=2; j<=i; j++) {
				
				
				list.add(i%j);
				
				
				if(list.size()<3) {
					
					break;
				
				}else {
					
					primeList.add(i);
					counter++;
					
				}
				
				
				
			}
			
			
			
		}
		
		System.out.println(counter);
		
		
		for(int k=0; k<primeList.size(); k++) {
			
			
			System.out.println(primeList.get(k));
		}
		
	}
	
	
}
