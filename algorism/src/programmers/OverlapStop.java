package programmers;

import java.util.*;




public class OverlapStop {


	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		
		ArrayList<Integer> list= new ArrayList<Integer>();
		
		Solution3 sol=new Solution3();
		
		
		int num=sc.nextInt();
		
		
		
		int[] arr=new int[num];
		
		
		int[] answer=sol.solution(arr);
		
		for(int i=0; i<answer.length;i++) {
			
			
			list.add(answer[i]);
			
		}
	
		System.out.println(list);
		
	
	}
}


class Solution3 {
    public int[]  solution(int []arr) {
    	Scanner sc=new Scanner(System.in);
		ArrayList<Integer> list=new ArrayList<Integer>();
    	Deque<Integer> dq=new LinkedList<Integer>();
    	dq.push(-1);
    	
    	for(int i=0; i<arr.length; i++) {
    		
   
    		arr[i]=sc.nextInt();
    		
   
    		dq.add(arr[i]);
    	
    		
    		if(dq.pollFirst() != arr[i] ) {
        		
    			list.add(arr[i]);
    			
    		}
    	}


    	int[] answer=new int[list.size()];
    	
    	for(int i=0; i<list.size(); i++) {
    		
    		
    		if(list.get(i)!=0) {
    			
    			answer[i]=list.get(i);
    			
    		}
    	
    	}
    	
    
    	return answer;
    }
}
