package course;

import java.util.Scanner;

public class CourseMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		

		CourseEgn egn=new CourseEgn();

		
		while(true){
			try {
				
				System.out.println("====|1.������ ��� |2.�л� ���====");
				Scanner sc=new Scanner(System.in);
				int divNum=sc.nextInt();
				switch(divNum){

				case 1:
					egn.adminChoice();
					break;
				case 2:	
					egn.studentChoice();
					break;
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("�߸��� �Է��Դϴ�.");
				
			}
		}


	}

}
