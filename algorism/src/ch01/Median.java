package ch01;

import java.util.Scanner;

public class Median {

	/*
	 * 세 정수의 중앙값을 구합니다.
	 * a:1
	 * b:3
	 * c:2
	 * 중앙값 2
	 * 
	 * */
	
	public static int median(int a, int b, int c) {
		
		
		if(a>=b || b<=c) {
			
			return b;
		}else if(b>=a || a<=c ) {
			
			return a;
		}else if(a>=c || c<=b) {
			
			return c;
		}else {
			
			return 0;
		}
		
	}
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.print("a의 값");int a=sc.nextInt();
		System.out.print("b의 값");int b=sc.nextInt();
		System.out.print("c의 값");int c=sc.nextInt();
		
		System.out.println("중앙값"+median(a,b,c));
		
		
	}
	
	
}
