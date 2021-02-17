package ch02;

import java.util.Scanner;

public class ArrayEqual {

	/*
	 * 배열 a의 요솟수 5
	 * x[0] =10
	 * x[1]=73
	 * x[2]=-5
	 * x[3]=42
	 * 배열 b의 요솟수 5
	 * x[0] =10
	 * x[1]=73
	 * x[2]=-5
	 * x[3]=42
	 * 
	 *메소드 만들어서 
	 * 배열 a와 b는 같습니다.
	 * */
	static boolean flag;
	
	public static boolean equal(int a[],int b[]) {
		
		Scanner sc=new Scanner(System.in);
		
		
		
		if(a.length!=b.length) {
			
			
			flag=false;
		}
		
		
		for(int i=0; i<a.length; i++) {
			
			
			if(a[i]!=b[i]) {
				
				
				flag=false;
			} else if(a[i]==b[i]) {
				
				flag=true;
			}		
			
		}
		
		
		return flag;
		
		
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
			
			equal(a,b);
		}
			
		for(int i=0; i<b.length; i++) {
			

			System.out.println("b["+i+"]=");
			b[i]=sc.nextInt();
			
			equal(a,b);
		}
		
		if(equal(a,b)==true){
			
			
			System.out.println("같습니다.");
		}else {
			
			
			System.out.println("다릅니다.");
		}
		
		
	}
	
	
}


