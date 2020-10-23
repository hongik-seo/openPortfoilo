package course;

import java.util.Scanner;

public class CourseEgn {

	String adminID;
	String adminPWD;
	
	Admin ad=new Admin();
	Student stu=new Student();
	
	
	public void studentChoice() {

		try {
			while(true) {


				System.out.println("=============================================================");
				System.out.println("============1.로그인|2.재로그인 및 점수확인|3.관리자모드|4.종료==========");
				System.out.println("=============================================================");


				Scanner sc=new Scanner(System.in);



				int studentChoice;
				switch(studentChoice=sc.nextInt()) {

				case 1: 
					System.out.println("초기비밀번호는 0000입니다.");

					System.out.print("학번을 입력하세요");int serialNumFindF=sc.nextInt();
					System.out.print("변경 하실 비밀번호는");String studentPWD=sc.next();
					stu.loginFrist(serialNumFindF, studentPWD);

					break;

				case 2:
					System.out.print("학번을 조회합니다.");int serialNumFindS=sc.nextInt();
					System.out.print("비밀번호를 확인합니다.");String studentPWDFind=sc.next();
					stu.loginSecond(serialNumFindS, studentPWDFind);
					break;

				case 3: 
					System.out.println("관리자 모드로 전환합니다.");
					adminChoice();
					break;

				case 4: System.out.println("프로그램을 종료합니다.");
				System.exit(0);
				break;


				}
				continue;

			}

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("잘못된 입력입니다.");
		}
	}
	

	public void adminChoice() {
		try{
			while(true) {


				System.out.println("===================================================================");
				System.out.println("============1.학생추가|2.전교생 점수보기|3.학생 삭제|4.학생모드|4.종료==========");
				System.out.println("===================================================================");

				Scanner sc=new Scanner(System.in);




				int adminChoice;

				switch(adminChoice=sc.nextInt()) {



				case 1:

					System.out.print("관리자 아이디를 입력하세요");adminID=sc.next();
					System.out.print("관리자 비빌번호를 입력하세요");adminPWD=sc.next();

					if(adminID.equals("scott")&&adminPWD.equals("tiger")){
						System.out.print("학번은");int serialNum = sc.nextInt();
						System.out.print("전공은");String major=sc.next();
						System.out.print("이름은");String name=sc.next();
						System.out.print("자바 점수는 ");int javaScore=sc.nextInt();
						System.out.print("오라클 점수는");int dataScore=sc.nextInt();

						ad.addStudentList(serialNum,name, major, javaScore, dataScore);
					}else {
						System.out.println("관리자 아이디와 관리자 비빌번호를 확인해주세요");
					}
					break;


				case 2: 
					System.out.print("관리자 아이디를 입력하세요");adminID=sc.next();
					System.out.print("관리자 비빌번호를 입력하세요");adminPWD=sc.next();

					if(adminID.equals("scott")&&adminPWD.equals("tiger")){
						ad. showStudnetList();
					}
					break;
				case 3:
					System.out.print("관리자 아이디를 입력하세요");adminID=sc.next();
					System.out.print("관리자 비빌번호를 입력하세요");adminPWD=sc.next();

					if(adminID.equals("scott")&&adminPWD.equals("tiger")){
						System.out.print("삭제하실 학번은 입력해주세요");int removeSerialNum=sc.nextInt();
						ad.removeStudentList(removeSerialNum);
					}else {
						System.out.println("관리자 아이디와 관리자 비빌번호를 확인해주세요");
					}
					break;

				case 4:

					System.out.println("학생모드로 전환합니다.");
					studentChoice();
					break;

				case 5:
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
					break;


				}//end of switch

				continue;

			}//end of while

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("잘못된 입력입니다.");
		}
	}//end of method

}//end of class

