package banking_Sysyem_Test;

import java.util.Scanner;


public class BankingSysyemTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		System.out.println("-----------------------------------");
		System.out.println("1.계좌생성|2.계좌목록|3.예금|4.출글|5.종료");
		System.out.println("-----------------------------------");
		System.out.print("선택 >");

		Scanner sc=new Scanner(System.in);


		//변수 선얼
		
		
		Customer customer=new Customer();
		
	
		int choice=sc.nextInt();
		
		while(true) {
			
				
			
	
			switch(choice) {


			case 1:
				
				customer.intialMoney();
				continue;
			case 2: 
				customer.result();
				continue;
				
				
			case 3:
				System.out.println("계좌번호");
				System.out.println("예금액");
				customer.saveMoney();
				continue;
				
			
			case 4:
				System.out.println("계좌번호");
				System.out.println("출금액");
				customer.takeMoney();
				continue;
			case 5:
				
				System.out.println("프로그램 종료");
				break;
			}
			
		


		}

	}	


}
		

	


