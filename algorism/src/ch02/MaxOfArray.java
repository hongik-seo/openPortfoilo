package ch02;

import java.util.Scanner;

public class MaxOfArray {

	
	/*
	 *Ű�� �ִ밪�� ���մϴ�. 
	 *����� 5;
	 *height[0]=172
	 *height[1]=153
	 *height[2]=192
	 *height[3]=140
	 *height[4]=165
	 *���� �Է� ����
	 *�ż��� ����
	 *
	 */
	
	public static int maxOf(int a[]) {
		
		Scanner sc=new Scanner(System.in);
		
		int max=a[0];
		
		for(int i=0; i<a.length; i++) {
			
			a[i]=sc.nextInt();
			System.out.println("a["+i+"]="+a[i]);
			
			if(a[i]>=max) {
				
				max=a[i];
				
			}
			
		}
		
		
		
		return max;
	}
	
	
	public static void main(String[] args) {
		
		
		System.out.print("Ű�� �ִ밪�� ���մϴ�.");
		
		Scanner sc=new Scanner(System.in);

		int k=sc.nextInt();

		System.out.print("�������");System.out.print(k);
		
		

		
		int[] a=new int[k];
		
		System.out.println("�ִ밪��"+maxOf(a)+"�Դϴ�.");
	
		
		
		
	}
	
	
	
	
}
