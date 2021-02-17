package ch02;

import java.util.Scanner;

public class ReverseArray2 {

	static void swap(int[]a,int idx1, int idx2) {
		
		
		int temp=a[idx1]; 
		a[idx1]=a[idx2];
		a[idx2]=temp;
		
	}
	
	
	static void reverse(int[]a) {
		
		for(int i=0; i<a.length/2; i++) {
			
			swap(a,i,a.length-1-i);
			
		}
		
	}
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.print("요소수 :::" );
		int num=sc.nextInt();
		
		int[] x=new int[num];
		
		for(int i=0; i<x.length; i++) {
			
			System.out.println("x["+i+"] =");
			x[i]=sc.nextInt();
			
		}
		
		reverse(x);
		
		
		System.out.println("배열을 역순으로 정렬합니다.");
		
		
		for(int i=0; i<num; i++) {
			
			System.out.println("x["+i+"] ="+x[i]);
			
			
		}
		
		
	}
	
	
}
