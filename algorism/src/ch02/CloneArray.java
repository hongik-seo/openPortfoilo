package ch02;

import java.util.Arrays;

public class CloneArray {

	/*
	 * a=12345
	 * b=12305
	 * clone�żҵ带 �Ἥ ����
	 * */
	
	public static void main(String[] args) {
		
		
		int[] a= new int[5];
		
		int[] b= null;
		for(int i=0; i<a.length; i++) {
			
			a[i]=i+1;
			
			System.out.print(a[i]+",");

			b= Arrays.copyOf(a,i+1);
			
			
			
		}
		
		System.out.println();
		b[3]=0;
		
		
		for(int i=0; i<b.length; i++) {
			
			
			System.out.print(b[i]+",");
		}
			
		
		
				
		
	}

	
	
}

