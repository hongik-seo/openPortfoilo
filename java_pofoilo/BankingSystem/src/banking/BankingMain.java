package banking;

import java.util.Scanner;

public class BankingMain {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		
		BankingEng eng=new BankingEng();
		
		
		while(true) {
			
			int divChoice;
			System.out.println("=========================");
			System.out.println("===1.관리자모드|2.사용자모드===");
			System.out.println("=========================");
		switch(divChoice=sc.nextInt()) {
			
		case 1:
			eng.adminChoice();
			break;
		case 2:
			eng.userChoice();
			break;
		}
		}
		
		
	} 
	
}
