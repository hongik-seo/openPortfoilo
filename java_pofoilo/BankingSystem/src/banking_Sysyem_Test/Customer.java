package banking_Sysyem_Test;

import java.util.Scanner;

public class Customer{
	
	
	Scanner sc=new Scanner(System.in);	
	
	//필드 선언
	
	String name;
	int accountNum;
	int balance;
	int money;
	int result;
	
	
	
	
	

	public boolean intialMoney() {

		this.accountNum=sc.nextInt();
		this.name=sc.next();
		this.money=sc.nextInt();
		this.result=(balance+=money);

		if((accountNum>10000000)&&(result>0)) {
		System.out.println("계좌가 생성되었습니다.");
			return true;
		
		}else {
			
			System.out.println("계좌번호 1000000이상 초기입금액 0원이상");
			return false;
		}
	
	}
	
	public void result() {
		
		if((intialMoney()==true)||(saveMoney()==true)||(takeMoney() ==true)) {
			
			System.out.println(this.accountNum);
			System.out.println(this.name);
			System.out.println(this.result);
			
		}else {
			
			System.out.println("계좌가 없습니다.");
		}
		
		
	}


	

	public boolean saveMoney() {
		
			
		if(intialMoney()==true) {
			balance+=money;
			System.out.println("예금이 성공적으로 되었습니다.");
			return true;
			
		}else {
			
		
			return false;
		}
						
			
		}
	
	public boolean takeMoney() {
		accountNum=sc.nextInt();
		
		if(intialMoney()==true&& saveMoney()==true) {
			balance-=money;
			System.out.println("출금이 성공적으로 되었습니다.");
			return true;
			
		}else {
		
			return false;
		}
		
		
		
		
	}

	
	
		
	}


	
	

	



