package course;

public class Student {

	
	
	String major;
	int javaScore;
	int dataScore;
	String studentPWD="0000";
	String name;
	int serialNum;
	
	
	
	

	
	Student(){}
	
	Student(int serialNum,String name,String major,int javaScore, int dataScore){
		this.name=name;
		this.serialNum=serialNum;
		this.major=major;
		this.javaScore=javaScore;
		this.dataScore=dataScore;
		
		
	}




	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getSerialNum() {
		return serialNum;
	}


	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}



	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}





	public int getJavaScore() {
		return javaScore;
	}





	public void setJavaScore(int javaScore) {
		this.javaScore = javaScore;
	}





	public int getDataScore() {
		return dataScore;
	}





	public void setDataScore(int dataScore) {
		this.dataScore = dataScore;
	}




	public String getStudentPWD() {
		return studentPWD;
	}


	public void setStudentPWD(String studentPWD) {
		this.studentPWD = studentPWD;
	}

	
	public void loginFrist(int serialNumFindF ,String studentPWD) {

		for(int i :Admin.list.keySet()) {
		if(this.studentPWD.equals("0000")&&Admin.list.get(i).getSerialNum()==serialNumFindF) {
			System.out.println("재로그인 하세요");
			this.studentPWD=studentPWD;

//			return studentPWD;

		}
		}
	//	return studentPWD;
	}	



	public void loginSecond(int serialNumFindS,String studentPWDFind) {

		for(int i :Admin.list.keySet()) {
			if(!this.studentPWD.equals("0000")&&Admin.list.get(i).getSerialNum()==serialNumFindS&&this.studentPWD.equals(studentPWDFind)) {
				Admin ad=new Admin();
				ad.showStudnetList();

			}

		}



	}





}
