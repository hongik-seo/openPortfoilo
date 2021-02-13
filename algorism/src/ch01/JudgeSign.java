package ch01;

import java.util.Scanner;

public class JudgeSign {

	
	/*
	 * 정수를 입력하시오 5
	 * 이수는 양수입니다. 
	 * 정수를 입력하세요 -5
	 * 이수는 음수 입니다. 
	 * 정수를 입력하세요 0
	 * 이수는 0입니다.
	 * 
	 * 
	 * */
	
	
	public static void main(String[] args) {
		
		
		
		Scanner sc=new Scanner(System.in);
		
		System.out.print("정수를 입력하시오 ");int a=sc.nextInt();
		
		
		
		if(a>0) {
			
			System.out.println("이 수는 양수 입니다.");
			
		}else if(a<0) {
			
			System.out.println("이 수는 음수 입니다.");
			
		}else if(a==0) {
			
			System.out.println("이 수는 0 입니다.");
			
		}else {
			
			System.out.println("잘못 입력하였습니다.");
			
		}
		
		
	}
}
