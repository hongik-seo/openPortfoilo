package ch02;

import java.util.Scanner;

public class IntArray {

	/*
	 * a[0] :0
	 * a[1] :37
	 * a[2] :51
	 * a[3] :0
	 * a[4] :74
	 * ���� ����� �ڷ����� int���� �迭 (������ڼ��� 5 :new�� ���� ��ü�� ����) 
	 * 
	 * */
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		int[] a=new int[5];
		
		for(int i=0; i<a.length; i++) {
			
			a[i]=sc.nextInt();
			
			System.out.println("a["+i+"]="+a[i]);
		}
		
		
	}
	
}
