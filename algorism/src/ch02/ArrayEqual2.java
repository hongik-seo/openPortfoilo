package ch02;

import java.util.Scanner;

public class ArrayEqual2 {

	
	static boolean eqaul(int[]a,int b[]) {
		
		
		if(a.length !=b.length) {
			return false;
		}
		
		for(int i=0; i<a.length; i++) {
			if(a[i]!=b[i]) {
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) {
		
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("배열 a의요솟수 :");
		int idx=sc.nextInt();
		

		System.out.println("배열 b의요솟수 :");
		int idx2=sc.nextInt();
		
		int a[]=new int[idx];
		
		
		int b[]=new int[idx2];
		
		
		
		for(int i=0; i<a.length; i++) {
			
			System.out.println("a["+i+"]=");
			a[i]=sc.nextInt();
			
			
		}
			
		for(int i=0; i<b.length; i++) {
			

			System.out.println("b["+i+"]=");
			b[i]=sc.nextInt();
			
		}
		
		System.out.println("배열 a와 b는"+(eqaul(a,b)?"같습니다.":"다릅니다."));
		
		
	}
}
