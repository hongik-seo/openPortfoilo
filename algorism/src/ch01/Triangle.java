package ch01;

import java.util.Scanner;

public class Triangle {
	//���� �Ʒ��� ������ �̵ �ﰢ���� ����մϴ�. 
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("���� �Ʒ��� ������ �̵ �ﰢ���� ����մϴ�.");
		
		int n=sc.nextInt();
		System.out.println("��� �ﰢ���Դϱ�"+n);
		
		for(int i=0; i<n; i++) {
			
			for(int j=0; j<=i; j++) {
			
			System.out.print("*");
			
			
			
			}
			System.out.println();
			
		}
		
		
		
	}

}
