package banking;

import java.util.Scanner;

public class BankingEng {


	Admin ad=new Admin();
	User use=new User();


	public void userChoice() {





		while(true) {
			System.out.println("========================사용자모드==============================");
			System.out.println("==========1.계좌이체|2.입금|3.출금|4.계좌조회|5.관리자모드|6.종료=======");
			System.out.println("=============================================================");
			Scanner sc=new Scanner(System.in);
			
			int userChoiceNum=sc.nextInt();

			switch(userChoiceNum) {



			case 1: 
				System.out.print("내 계좌주 계좌번호는");int meAccountNum=sc.nextInt();
				System.out.print("비밀번호는 ");int sendPWD=sc.nextInt();

						System.out.print("보낼 계좌주 계좌번호는");int youAccountNum=sc.nextInt();
						System.out.print("송금액은");int sendMoney=sc.nextInt();


						use.sendMoney(sendMoney,meAccountNum,youAccountNum,sendPWD);

						break;

			case 2:	


				System.out.print("입금할 계좌주 계좌번호는");int userAccountNum=sc.nextInt();
				System.out.print("비밀번호는 ");int putUserPWD=sc.nextInt();
				System.out.print("입금액은");int money=sc.nextInt();

				
				

					use.putMoney(money,userAccountNum,putUserPWD);

				

				break;


			case 3: 

				System.out.print("출금할 계좌주 계좌번호는");int takeUserAccountNum=sc.nextInt();
				System.out.print("비밀번호는 ");int takeUserPWD=sc.nextInt();
				System.out.println("출금액은");int takeMoney=sc.nextInt();



					use.takeMoney(takeMoney,takeUserAccountNum,takeUserPWD);
				
				break;

			case 4: 

				System.out.print("조회할 계좌주 계좌번호는");int theUserAccountNum=sc.nextInt();
				System.out.print("조회할 계좌주 비밀번호는");int theUserPWD=sc.nextInt();
				use.thisUserinfo(theUserAccountNum,theUserPWD);
				break;
			case 5:	adminChoice();
			break;
			case 6: System.exit(0);
			break;

			}
			continue;


		}
	}


	public void adminChoice() {
		String adminID;
		String adminPWD;
		String userFindPWD;


		while(true) {



			System.out.println("========================관리자 모드=============================");
			System.out.println("==========1.계좌계설|2.계좌삭제|3.계좌 조회|4.사용자 모드|5.종료=========");
			System.out.println("=============================================================");
			Scanner sc=new Scanner(System.in);
			int adminChoiceNum=sc.nextInt();

			switch(adminChoiceNum) {


			case 1: 
				System.out.print("만드실 계좌네임을 이력해주세요 :");String userName=sc.next();
				int userAccountNum=(int)(Math.random()*100000)+1;
				System.out.print("만드실 계좌비밀번호를 입력해주세요");int userPWD=sc.nextInt();
				ad.makeAccountList(userAccountNum,userName, userPWD);
				System.out.println("계좌번호는 자동 할당됩니다."+userAccountNum);
				break;

			case 2:

				System.out.print("삭제할 계좌주 계좌번호");int deletAcN=sc.nextInt();

				ad.removeAccountList(deletAcN);
				break;

			case 3: 

				ad.showAccountlist();
				break;

			case 4: userChoice();
			break;
			case 5:System.exit(0);
			break;
			}
			continue;



		}


	}

}
