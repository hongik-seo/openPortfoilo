package ch02;

public class IntArrayInit {

	/*
	 * a[0]=1
	 * a[1]=2
	 * a[2]=3
	 * a[3]=4
	 * a[4]=5
	 * */

	//배열 선언과 동시에 초기화 
	
	
	public static void main(String[] args) {
		
		int[] a=new int[]{1,2,3,4,5};
		
		
		for(int i=0; i<a.length; i++) {
			

			System.out.println("a["+i+"]="+a[i]);
			
		}
		
	}
	
	
}
