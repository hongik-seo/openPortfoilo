package ch02;

public class ArraySumForIn {
	
	
	/*
	 * a[0]=1.0
	 * a[1]=2.0
	 * a[2]=3.0
	 * a[3]=4.0
	 * a[4]=5.0
	 * 모든 요소를 15.0입니다.
	 * 향상된 포문 써서 
	 * */
	
	
	public static void main(String[] args) {
		
		float[] arr=new float[5];
		
		
		float i=0.0f;
		
		float sum=0.0f;
		
		
		
		
		for(float a:arr) {
		
			int t=0;
		
			i++;
			
			arr[t]=i;
			
			System.out.println(arr[t]);
			
			sum+=i;
			
			
		}
		
		System.out.println(sum);
		
		
	}

}
