package ch02;

import java.util.Scanner;

public class ReverseArray {

	/*
	 ¿ä¼Ú¼ö:5
	 x[0]=10
	 x[1]=73
	 x[2]=2
	 x[3]=-5
	 x[4]=42
	 *======
	 ¿ä¼Ú¼ö:5
	 x[0]=42
	 x[1]=-5
	 x[2]=2
	 x[3]=73
	 x[4]=10
	 * */
	
	/* ¹°ÀÜ ±³È¯
	 * 	int temp=0	
	 * 	int a=1;
		int b=2;
		
		temp=b;  
		b=a;     
		a=temp; 
		
	 * 
		*/
	
	
	public static void Reverse(int[] a,int i,int j) {
		
	
			int temp=0;
			temp=a[i];
			a[i]=a[j];
			a[j]=temp;
		
				
			System.out.println(a[j]);
			
			
		
		
		
	}
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("¿ä¼Ò¼ö");
		

		int num=sc.nextInt();
		
		int[] a=new int[num];
	
		
		
		
		
		
		for(int i=0; i<a.length; i++ ) {
		
			
				a[i]=sc.nextInt();
			
			
			for(int j=0; j<=i; j++) {
					
				Reverse(a,i,j);
				
			}
				
		}
		 
		
	}
	
	
	
	
}
