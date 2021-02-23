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

		int[] answer= {};
		
		
		
		ArrayList<Integer> list=new ArrayList<Integer>();
    	Deque<Integer> dq=new LinkedList<Integer>();
    	ArrayList<Integer> list2=new ArrayList<Integer>();
    	
    	for(int i=0; i<arr.length; i++) {
    		
   
    		arr[i]=sc.nextInt();
    		
   
    		dq.add(arr[i]);
    	
    		list.add(arr[i]);
    	}

    	dq.push(0);
    	
    	for(int i=0; i<list.size(); i++) {
    		
    		if(dq.pollFirst() != list.get(i)) {
    			
    			System.out.println(dq.element());
    			list2.add(dq.element());
    			
    		}
    		
    		
    		
    		
    	}
    	
    	System.out.println(list2);
    	
    	answer=new int[list2.size()];
    	
    	for(int k=0; k<answer.length; k++) {
    		
    	
    		answer[k]=list2.get(k);
    		
    		if(answer.length-1==k) {
    			
    			
    			return answer;
    		}
    	}    	
    	
    	
    	return answer;
    }
}
