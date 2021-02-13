package ch01;

import java.util.Scanner;

public class Digits {

	/*
	 * 2자리의 정수를 입력하시오
	 * 입력 5
	 * 입력 105
	 * 입력 57
	 * 변수 no의 값은 57입니다. 
	 * 
	 *2자리의 양수(10~99를 입력합니다.)
	 * 
	 * 
	 * */
	
	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("2자리의 정수를 입력하시오");
		
		int no=0; 
		/*
		do {

			System.out.print("입력 :");
			no=sc.nextInt();
			System.out.println("");
			
		}while(no<10  || no>99);
		
		
		System.out.println("변수 no의 값은"+no+"입니다.");
		*/
		
		while(true) {
			System.out.print("입력 :");
			no=sc.nextInt();
			
			if(no>=10 && no<=99) {
				
				break;
				
			}else {
				
				continue;
			}
			
			
		}
		
		System.out.println("변수 no의 값은"+no+"입니다.");
		
	}
	
}
