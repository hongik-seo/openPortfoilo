package ch02;

import java.util.Scanner;

public class DayOfYear2 {

	
	static int[][] days= {
			
			{31,28,31,30,31,30,31,31,30,31,30,31},
			{31,29,31,30,31,30,31,31,30,31,30,31},
	};
	
	
	static int isLeap(int year) {
		
		return (year % 4 == 0 && year % 100 !=0) || (year % 400 ==0)?1:0; 

		//1�� ����
		//2�� ���		
	}
	
	static int dayOfYear(int year, int month, int day) {
		
		
		for(int i=0; i<month-1; i++) {
			
			day +=days[isLeap(year)][i];
			
		}
		
		
		return day;
	}
	
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("��");
		int year=sc.nextInt();
		
		System.out.println("��");
		int month=sc.nextInt();
		
		System.out.println("��");
		int day=sc.nextInt();;
		
		System.out.println(dayOfYear(year, month, day));;
		
		
	}
	
}
