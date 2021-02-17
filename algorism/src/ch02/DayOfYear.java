package ch02;

import java.util.Scanner;

public class DayOfYear {

	static int[] days= {31,28,31,30,31,30,31,31,30,31,30,31};
	static int sumday=0;
	
	//년도에 따름 월수 판단
 	static int isLeap(int year) {
		
		return (year % 4 == 0 && year % 100 !=0) || (year % 400 ==0)?1:0; 

		//1은 윤년
		//2는 평년

			
	}


	public static int sumday(int year, int month,int day) {
		
		
		
		for(int i=0; i<month-1; i++) {
			
			
			if(isLeap(year)==0 ) {
			
				sumday+=days[i];
				//평년
				
				System.out.println("평년입니다.");
				
			
			}else if(isLeap(year)==1) {
				
				//윤년
				days[1]=29;
				
				sumday+=days[i];
				
				System.out.println("윤년입니다.");
				
			}
			
		}
	
		
		
		return sumday+day;
		
	}
	
	
	
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("년");
		int year=sc.nextInt();
		
		System.out.println("월");
		int month=sc.nextInt();
		
		System.out.println("일");
		int day=sc.nextInt();;
		int comday=0;
		for(int i=0; i<month; i++) {

		comday=(isLeap(year)==1) ? 29 : days[i];
		
		
	
		
		}
		
		
		if(comday>0 && comday>day) {
			
				
		
			System.out.println("그해 경과일수는 ="+sumday(year,month,day));
			
		}
		
		
		
		
		
		
		
				
	}
}
