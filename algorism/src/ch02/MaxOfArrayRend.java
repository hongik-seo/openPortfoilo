package ch02;

import java.util.Random;
import java.util.Scanner;

public class MaxOfArrayRend {

	/*
	 * Ű�� �ִ밪�� ���մϴ�. 
	 * �����:5 
	 * Ű ���� �Ʒ��� �����ϴ�. 
	 *height[0]=172
	 *height[1]=137
	 *height[2]=168
	 *height[3]=189
	 *height[4]=113
	 *�ִ� ���� 189�Դϴ�. 
	 * �żҵ� ���� �׸��� ���� ������
	 * */
	
	public static int maxOf(int[] a) {
		
		int max=0;
		Random ran=new Random();
		
		
		a[0]=100+ran.nextInt(90);
		
		max=a[0];
		
		System.out.println(max);
	
		for(int i=0; i<a.length; i++) {
			
			a[i]=100+ran.nextInt(90);
			
			System.out.println("a["+i+"]="+a[i]);
			if(max<a[i]) {
				
				max=a[i];
				
			}
			
			
		}
		
		
		return max;
	}
	
	
	public static void main(String[] args) {
		
		System.out.println("Ű�� �ִ밪�� ���մϴ�.");
		
		Scanner sc=new Scanner(System.in);
		
		int i=sc.nextInt();
		
		System.out.print("�����");System.out.println(i);
		
		
		int[] a= new int[i];
		
		
		
		System.out.println(maxOf(a));;
		
		
		
	}
	
	
}
