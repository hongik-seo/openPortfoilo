package banking;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Admin {

	private int userFindPWD;
	static ArrayList<User> list;

	Admin(){
		list= new ArrayList<User>();

	}





	public int getUserFindPWD() {
		//Scanner sc=new Scanner(System.in);
		return userFindPWD;
	}





	public void setUserFindPWD(int userFindPWD) {
		this.userFindPWD = userFindPWD;
	}





	public ArrayList<User> makeAccountList(int userAccountNum, String userName,int userPWD) {



		list.add(new User(userAccountNum,userName,userPWD));

		return list;

	}


	public void showAccountlist() {


		for(int i=0; i<list.size(); i++) {

			System.out.println(list.get(i).getAll());


		}
	}

	public void removeAccountList(int deletAcN) {

		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getUserAccountNum()==(deletAcN)) {

				list.remove(i);

			}


		}


	}


}
	