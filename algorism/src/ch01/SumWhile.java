package ch01;

import java.util.Scanner;

public class SumWhile {
	
	/*
	 * 1부터 n의 값을 구합니다. 
	 * n=5;
	 * */
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		int sum=0;
		System.out.println("1부터 n의 합을 구합니다.");
		System.out.println("n의 값");int n=sc.nextInt();
		
		/*for(int i=1; i<=n; i++) {
			
			sum+=i;
			
		}
		
		System.out.println("총합은"+sum);
		*/
		
		int i=1;
		
		while(i<=n) {
			
			sum+=i;
			
			i++;
		}
		
		System.out.println("총합은"+sum);
		
		
	}

}
