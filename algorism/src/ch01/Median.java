package ch01;

import java.util.Scanner;

public class Median {

	/*
	 * �� ������ �߾Ӱ��� ���մϴ�.
	 * a:1
	 * b:3
	 * c:2
	 * �߾Ӱ� 2
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
		
		System.out.print("a�� ��");int a=sc.nextInt();
		System.out.print("b�� ��");int b=sc.nextInt();
		System.out.print("c�� ��");int c=sc.nextInt();
		
		System.out.println("�߾Ӱ�"+median(a,b,c));
		
		
	}
	
	
}
