package course;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

import course.Major.SmartWeb;

public class Admin {

	static HashMap<Integer,Student> list=new HashMap<Integer,Student>();
	
	
	int serialNum;

	
	
	
	
	public void addStudentList(int serialNum,String name,String major,int javaScore,int dataScore) {
		Student stu=new Student();
		int i=0;
		
		
		this.serialNum=i;
		i=serialNum;
		
		if(stu.getMajor().equalsIgnoreCase("smartweb")||stu.getMajor().equalsIgnoreCase("bigdata")) {
		list.put(i,new Student(serialNum,name,major,javaScore,dataScore));
		}
	}
	
	
	public void showStudnetList() {
		
	
		
		for (int i : list.keySet()) {
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.print("학변은");System.out.print(list.get(i).getSerialNum()+"\n");
			System.out.print("이름은");System.out.print(list.get(i).getName()+"\n");
			System.out.print("전공은");System.out.print(list.get(i).getMajor()+"\n");
			System.out.print("자바점수는");System.out.print(list.get(i).getJavaScore()+"\n");
			System.out.print("오라클점수는");System.out.print(list.get(i).getDataScore()+"\n");
			
			if(list.get(i).getMajor().equalsIgnoreCase("SmartWeb")) {

				System.out.print("자바학점은");System.out.print(Major.SmartWeb.java()+"\n");
				System.out.print("오라클 학점은");System.out.print(Major.SmartWeb.oracle()+"\n");
				System.out.print("총점은");System.out.print(list.get(i).getDataScore()+list.get(i).getJavaScore()+"\n");



			}else if(list.get(i).getMajor().equalsIgnoreCase("bigdata")) {

				System.out.print("자바학점은");System.out.print(Major.BigData.java()+"\n");
				System.out.print("오라클 학점은");System.out.print(Major.BigData.oracle()+"\n");
				System.out.print("총점은");System.out.print(list.get(i).getDataScore()+list.get(i).getJavaScore()+"\n");


			}
				
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			
		}
		
	
			
	


	}

	public void removeStudentList(int removeSerialNum) {

		for(int i :list.keySet()) {

			if(list.get(i).getSerialNum()==removeSerialNum) {	
				list.remove(i).getSerialNum();
				System.out.println("학생이 성공적으로 삭제되었습니다.");
			}


		}

	}
	
	
	

	

	



	public static HashMap<Integer, Student> getList() {
		return list;
	}

	public static void setList(HashMap<Integer, Student> list) {
		Admin.list = list;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	
	



}
