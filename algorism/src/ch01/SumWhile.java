package ch01;

import java.util.Scanner;

public class SumWhile {
	
	/*
	 * 1���� n�� ���� ���մϴ�. 
	 * n=5;
	 * */
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		int sum=0;
		System.out.println("1���� n�� ���� ���մϴ�.");
		System.out.println("n�� ��");int n=sc.nextInt();
		
		/*for(int i=1; i<=n; i++) {
			
			sum+=i;
			
		}
		
		System.out.println("������"+sum);
		*/
		
		int i=1;
		
		while(i<=n) {
			
			sum+=i;
			
			i++;
		}
		
		System.out.println("������"+sum);
		
		
	}

}
