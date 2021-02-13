package ch01;

import java.util.Scanner;

public class SumForPos {

	
	/*
	 * 양수만 입력 가능
	 * 1부터 n까지의 합을 구합니다. 
	 * n=-6;
	 * n=0;
	 * n=10
	 * 1부터 10까지의 합은 55입니다.
	 * 
	 * */
	
	public static void main(String[] args) {
		
		
		Scanner sc=new Scanner(System.in);
		System.out.println("1부터 n까지의 합을 구합니다.");
		int sum=0;
		int n=0; 
		
		for(;;) {
			n=sc.nextInt();
			
			if(n>0) {
				break;
			}else {
				
				continue;
			}
			
		}
		
		for(int i=1; i<=n; i++) {
			
			sum+=i;
			
		}
		
		System.out.println("1부터"+n+"까지의 총합은"+sum);
		
	}
}
