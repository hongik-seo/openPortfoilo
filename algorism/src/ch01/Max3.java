package ch01;

import java.util.Scanner;

public class Max3 {

	/*�� ������ �ִ밪 
	 * a:1
	 * b:3
	 * c:2
	 * 
	 * */
	
	public static void main(String[] args) {
		
		System.out.println("�� ������ �ִ� ���� ���Ͻÿ�");
		
		Scanner sc=new Scanner(System.in);
		
		int max=0;
		
		System.out.print("a�� ��");int a=sc.nextInt();
		System.out.print("b�� ��");int b=sc.nextInt();
		System.out.print("c�� ��");int c=sc.nextInt();
		
		
		max=a;
		
		if(max<b) {
			
			max=b;
		}
		
		if(max<c) {
			
			max=c;
			
		}
		
		System.out.println("�ִ� ����"+max+"�Դϴ�.");
		
	}
	
	
	
	
}
