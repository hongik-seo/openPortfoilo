package ch01;

import java.util.Scanner;

public class SumForPos {

	
	/*
	 * ����� �Է� ����
	 * 1���� n������ ���� ���մϴ�. 
	 * n=-6;
	 * n=0;
	 * n=10
	 * 1���� 10������ ���� 55�Դϴ�.
	 * 
	 * */
	
	public static void main(String[] args) {
		
		
		Scanner sc=new Scanner(System.in);
		System.out.println("1���� n������ ���� ���մϴ�.");
		int sum=0;
		int n=0; 
		
		for(;;) {
			n=sc.nextInt();
			
			if(n>0) {
				break;
			}else {
				
				continue;
			}
			
		}
		
		for(int i=1; i<=n; i++) {
			
			sum+=i;
			
		}
		
		System.out.println("1����"+n+"������ ������"+sum);
		
	}
}
