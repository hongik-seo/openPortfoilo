package ch02;

public class PrimNumber1 {

	/*
	 * 2
	 * 3
	 * 5
	 * 7
	 * Áß·«
	 * 991
	 * 997
	 * 
	 * */
	
	
	public static void main(String[] args) {
		
		int count=0;
		int dev=0;
		
		for(int i=2; i<=1000; i++) {
			
			int j;
			for( j=2; j<i; j++) {
				
				dev++;
				
				
						
				
				if(i%j==0) {
			
					break;
					
				}
				
				
				
			}
			
			if(i==j) {
				
				System.out.println(i);
				
			}
			
			
			
		}
		
		System.out.println("³ª´°¼ÀÀ» ¼öÇàÇÑ È½¼ö"+dev);
		
		
		
		
	}
}
