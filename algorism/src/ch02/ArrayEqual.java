package ch02;

import java.util.Scanner;

public class ArrayEqual {

	/*
	 * �迭 a�� ��ڼ� 5
	 * x[0] =10
	 * x[1]=73
	 * x[2]=-5
	 * x[3]=42
	 * �迭 b�� ��ڼ� 5
	 * x[0] =10
	 * x[1]=73
	 * x[2]=-5
	 * x[3]=42
	 * 
	 *�޼ҵ� ���� 
	 * �迭 a�� b�� �����ϴ�.
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
		
		System.out.println("�迭 a�ǿ�ڼ� :");
		int idx=sc.nextInt();
		

		System.out.println("�迭 b�ǿ�ڼ� :");
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
			
			
			System.out.println("�����ϴ�.");
		}else {
			
			
			System.out.println("�ٸ��ϴ�.");
		}
		
		
	}
	
	
}


