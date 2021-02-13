package ch01;

import java.util.Scanner;

public class Triangle {
	//왼쪽 아래가 직각인 이등변 삼각형을 출력합니다. 
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("왼쪽 아래가 직각인 이등변 삼각형을 출력합니다.");
		
		int n=sc.nextInt();
		System.out.println("몇단 삼각형입니까"+n);
		
		for(int i=0; i<n; i++) {
			
			for(int j=0; j<=i; j++) {
			
			System.out.print("*");
			
			
			
			}
			System.out.println();
			
		}
		
		
		
	}

}
