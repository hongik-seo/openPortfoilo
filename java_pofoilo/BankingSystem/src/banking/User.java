package banking;
import java.util.ArrayList;
import java.util.Scanner;

public class User  {
	
	private String userName;	// 클래스 변수
	
	
	// 인스턴스 변수
	private int userAccountNum;


	private int money;

	private int balance;
	
	private int userPWD;

	private final int MAX_COUNT=5;
	int count;

	
	public User() {}
	
	public int getBalance() {
		return balance;
	}


	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getUserPWD() {
			
			
			
		return userPWD;
	}



	public void setUserPWD(int userPWD) {
		this.userPWD = userPWD;
	}

	
	
	public User(int userAccountNum, String userName,int userPWD) {

		this.userAccountNum = userAccountNum;
		this.userName = userName;
		this.userPWD=userPWD;
	

	}

	
	public User(int userAccountNum, String userName) {

		this.userAccountNum = userAccountNum;
		this.userName = userName;
		

	}
	
	public User(int money) {
		
		this.money=money;
		
	}
	
	
	public int getUserAccountNum() {
		return userAccountNum;
	}


	public void setUserAccountNum(int userAccountNum) {
		this.userAccountNum = userAccountNum;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getMoney() {
		return money;
	}


	public void setMoney(int money) {
		this.money = money;
	}


	public String getAll() {


		return "계좌주 계좌번호는"+userAccountNum+"\n"+"계좌주 이름은"+userName+"\n"+"잔액은"+balance;
	}




	public void setAll(int userAccountNum, String userName) {

		this.userAccountNum = userAccountNum;
		this.userName = userName;

	}

	public void getAllList() {


		for(int i=0; i<Admin.list.size(); i++) {


			System.out.println(Admin.list.get(i).getAll());;

		}


	}

	public void setAllPlusMoney(int userAccountNum, String userName, int balance) {

		this.userAccountNum = userAccountNum;
		this.userName = userName;
		this.balance=balance;

	}






	public void putMoney(int money,int userAccountNum,int putUserPWD) {




		for(int i=0; i<Admin.list.size(); i++) {




			if(Admin.list.get(i).getUserAccountNum()==userAccountNum&&Admin.list.get(i).getUserPWD()==putUserPWD) {
				if(money>0&&money<10000000) {
					Admin.list.get(i).balance+=money;
					System.out.println(Admin.list.get(i).balance);

				}


			}




		}



	}
	
	public void sendMoney(int sendMoney,int meAccountNum,int youAccountNum,int sendPWD) {
		
		for(int i=0; i<Admin.list.size(); i++) {
			
			for(int t=0; t<Admin.list.size(); t++) {

		
				if(Admin.list.get(i).getUserAccountNum()==(meAccountNum)&&Admin.list.get(t).getUserAccountNum()==(youAccountNum)&&Admin.list.get(i).getUserPWD()==sendPWD) {

					Admin.list.get(i).balance-=sendMoney;
					Admin.list.get(t).balance+=sendMoney;
					System.out.println(Admin.list.get(i).balance);
					

				}
			}
		}
	}
		
	
	
		

	public void takeMoney(int takeMoney,int takeUserAccountNum,int takeUserPWD) {

		
		for(int i=0; i<Admin.list.size(); i++) {



			if(Admin.list.get(i).getUserAccountNum()==(takeUserAccountNum)&&Admin.list.get(i).getUserPWD()==takeUserPWD) {
				if(takeMoney>0 &&takeMoney<Admin.list.get(i).getBalance()) {
					Admin.list.get(i).balance-=takeMoney;
					System.out.println(Admin.list.get(i).balance);

				}
			}
		}


	}






	public void thisUserinfo(int theUserAccountNum,int theUserPWD){



		for(int i=0; i<Admin.list.size(); i++) {
			


			if(Admin.list.get(i).getUserAccountNum()==(theUserAccountNum)&&Admin.list.get(i).getUserPWD()==(theUserPWD)) {


				System.out.println(Admin.list.get(i).getAll());

			}

		}


	}

	





}
