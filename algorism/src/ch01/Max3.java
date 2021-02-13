package ch01;

import java.util.Scanner;

public class Max3 {

	/*세 정수의 최대값 
	 * a:1
	 * b:3
	 * c:2
	 * 
	 * */
	
	public static void main(String[] args) {
		
		System.out.println("세 정수의 최대 값을 구하시오");
		
		Scanner sc=new Scanner(System.in);
		
		int max=0;
		
		System.out.print("a의 값");int a=sc.nextInt();
		System.out.print("b의 값");int b=sc.nextInt();
		System.out.print("c의 값");int c=sc.nextInt();
		
		
		max=a;
		
		if(max<b) {
			
			max=b;
		}
		
		if(max<c) {
			
			max=c;
			
		}
		
		System.out.println("최대 값은"+max+"입니다.");
		
	}
	
	
	
	
}
