package ch02;

import java.util.Scanner;

public class Int2DArray {

	/*
	 * 
	 * x[0][0]=0
	 * x[0][1]=37
	 * x[0][2]=0
	 * x[0][3]=54
	 * x[1][0]=0
	 * x[1][1]=0
	 * x[1][2]=65
	 * x[1][3]=0
	 * 
	 * 
	 * */
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		
		int row=sc.nextInt();
		int col=sc.nextInt();
		
		int[][] x=new int[row][col];
		
		x[0][1]=37;
		x[0][3]=54;
		x[1][2]=65;
		
		for(int i=0; i<x.length; i++) {
			
			for(int j=0; j<x[i].length; j++) {
		
				System.out.println("x["+i+"]["+j+"]="+x[i][j]);	
			}
		
			
		}
		
	}

}
