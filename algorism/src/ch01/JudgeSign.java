package ch01;

import java.util.Scanner;

public class JudgeSign {

	
	/*
	 * ������ �Է��Ͻÿ� 5
	 * �̼��� ����Դϴ�. 
	 * ������ �Է��ϼ��� -5
	 * �̼��� ���� �Դϴ�. 
	 * ������ �Է��ϼ��� 0
	 * �̼��� 0�Դϴ�.
	 * 
	 * 
	 * */
	
	
	public static void main(String[] args) {
		
		
		
		Scanner sc=new Scanner(System.in);
		
		System.out.print("������ �Է��Ͻÿ� ");int a=sc.nextInt();
		
		
		
		if(a>0) {
			
			System.out.println("�� ���� ��� �Դϴ�.");
			
		}else if(a<0) {
			
			System.out.println("�� ���� ���� �Դϴ�.");
			
		}else if(a==0) {
			
			System.out.println("�� ���� 0 �Դϴ�.");
			
		}else {
			
			System.out.println("�߸� �Է��Ͽ����ϴ�.");
			
		}
		
		
	}
}
