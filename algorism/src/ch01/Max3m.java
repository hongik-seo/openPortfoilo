package ch01;

import java.util.Scanner;

public class Max3m {

	/*
	 * max3(3,2,1)=3
	 * max3(3,2,2)=3
	 * max3(3,1,2)=3
	 * max3(2,3,2)=3
	 * max3(1,3,2)=3
	 * max3(2,3,3)=3
	 * max3(1,2,3)=3
	 * */
	
	
	public static int max3(int a, int b, int c) {
		
		int max=a;
		
		if(max<b) {
			
			max=b;
		}
		
		if(max<c) {
			
			max=c;
			
		}
		
		
		return max;
	}
	
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		int max=0;
		
		System.out.print("a의 값");int a=sc.nextInt();
		System.out.print("b의 값");int b=sc.nextInt();
		System.out.print("c의 값");int c=sc.nextInt();
		
		
		System.out.println("max3"+"("+""+a+""+","+b+""+","+c+""+")"+"="+max3(a,b,c));
		
	}
	
	
	
}
