package ch02;

import java.util.Scanner;

public class MaxOfArray {

	
	/*
	 *키의 최대값을 구합니다. 
	 *사람수 5;
	 *height[0]=172
	 *height[1]=153
	 *height[2]=192
	 *height[3]=140
	 *height[4]=165
	 *값을 입력 받음
	 *매서드 만들어서
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
		
		
		System.out.print("키의 최대값을 구합니다.");
		
		Scanner sc=new Scanner(System.in);

		int k=sc.nextInt();

		System.out.print("사람수는");System.out.print(k);
		
		

		
		int[] a=new int[k];
		
		System.out.println("최대값은"+maxOf(a)+"입니다.");
	
		
		
		
	}
	
	
	
	
}
