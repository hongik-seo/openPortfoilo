package course;



public class Major{
	
	

	 public static class SmartWeb{
		
		

		  public static String java() {
				
			for(int i : Admin.list.keySet()) {
			  if(Admin.list.get(i).getJavaScore() >= 95 && Admin.list.get(i).getJavaScore() <= 100 ) {
			         return "S";
			      } else if(Admin.list.get(i).getJavaScore() >= 90 && Admin.list.get(i).getJavaScore() <= 94 ) {
			         return "A";
			      } else if(Admin.list.get(i).getJavaScore() >= 80 && Admin.list.get(i).getJavaScore() <= 89 ) {
			         return "B";
			      } else if(Admin.list.get(i).getJavaScore() >= 70 && Admin.list.get(i).getJavaScore() <= 79 ) {
			         return "C";
			      } else if(Admin.list.get(i).getJavaScore() >= 60 && Admin.list.get(i).getJavaScore() <= 69 ) {
			         return "D";
			      } else if(Admin.list.get(i).getJavaScore() < 60) {
			         return "F";
			      }
			}
			return "";
			
		}


		 public static String oracle() {
			// TODO Auto-generated method stub
			 // 일반과목
			
			for(int i : Admin.list.keySet()) {
		      if(Admin.list.get(i).getDataScore() >= 90 && Admin.list.get(i).getDataScore() <= 100) {
		         return "A";
		      } else if(Admin.list.get(i).getDataScore() >= 80 && Admin.list.get(i).getDataScore() <= 94) {
		         return "B";
		      } else if(Admin.list.get(i).getDataScore() >= 70 && Admin.list.get(i).getDataScore() <= 79) {
		         return "C";
		      } else if(Admin.list.get(i).getDataScore() >= 55 && Admin.list.get(i).getDataScore() <= 69) {
		         return "D";
		      } else if(Admin.list.get(i).getDataScore() < 55) {
		         return "F";
		      }
			}
			return "";
		}

	}

	static class BigData{

		static public String oracle() {
			// TODO Auto-generated method stub
			// 필수 과목
			
			for(int i : Admin.list.keySet()) {
		      if(Admin.list.get(i).getDataScore() >= 95 && Admin.list.get(i).getDataScore() <= 100 ) {
		         return "S";
		      } else if(Admin.list.get(i).getDataScore() >= 90 && Admin.list.get(i).getDataScore() <= 94 ) {
		         return "A";
		      } else if(Admin.list.get(i).getDataScore() >= 80 && Admin.list.get(i).getDataScore() <= 89 ) {
		         return "B";
		      } else if(Admin.list.get(i).getDataScore() >= 70 && Admin.list.get(i).getDataScore() <= 79 ) {
		         return "C";
		      } else if(Admin.list.get(i).getDataScore() >= 60 && Admin.list.get(i).getDataScore() <= 69 ) {
		         return "D";
		      } else if(Admin.list.get(i).getDataScore() < 60) {
		         return "F";
		      }
		     
		      
		      
			}
			 return "";

		}


		static public String java() {
			for(int i : Admin.list.keySet()) {
			      if(Admin.list.get(i).getJavaScore() >= 90 && Admin.list.get(i).getJavaScore() <= 100) {
			         return "A";
			      } else if(Admin.list.get(i).getJavaScore() >= 80 && Admin.list.get(i).getJavaScore() <= 94) {
			         return "B";
			      } else if(Admin.list.get(i).getJavaScore() >= 70 && Admin.list.get(i).getJavaScore() <= 79) {
			         return "C";
			      } else if(Admin.list.get(i).getJavaScore() >= 55 && Admin.list.get(i).getJavaScore() <= 69) {
			         return "D";
			      } else if(Admin.list.get(i).getJavaScore() < 55) {
			         return "F";
			      }
				}
				return "";
		}
		
		
	}

	
	
}
