package ch01;

import java.util.Scanner;

public class Digits {

	/*
	 * 2�ڸ��� ������ �Է��Ͻÿ�
	 * �Է� 5
	 * �Է� 105
	 * �Է� 57
	 * ���� no�� ���� 57�Դϴ�. 
	 * 
	 *2�ڸ��� ���(10~99�� �Է��մϴ�.)
	 * 
	 * 
	 * */
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("2�ڸ��� ������ �Է��Ͻÿ�");
		
		int no=0; 
		/*
		do {

			System.out.print("�Է� :");
			no=sc.nextInt();
			System.out.println("");
			
		}while(no<10  || no>99);
		
		
		System.out.println("���� no�� ����"+no+"�Դϴ�.");
		*/
		
		while(true) {
			System.out.print("�Է� :");
			no=sc.nextInt();
			
			if(no>=10 && no<=99) {
				
				break;
				
			}else {
				
				continue;
			}
			
			
		}
		
		System.out.println("���� no�� ����"+no+"�Դϴ�.");
		
	}
	
}
