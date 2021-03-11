package programmers;

import java.util.*;


public class WhatIsK {

    public static void main(String[] args) {

        Solution2 solution2= new Solution2();

        Scanner sc= new Scanner(System.in);

        System.out.println("arr의 길이는");
        int len=sc.nextInt();
        int[] array=new int[len];

        System.out.println("commends의 길이는");
        int row=sc.nextInt();
        int col=3;

        int[][] commands=new int[row][col];


        System.out.println(solution2.solution(array,commands));

    }

}



class Solution2 {
    public int[] solution(int[] array, int[][] commands) {
        Scanner sc= new Scanner(System.in);

        ArrayList<Integer> list=new ArrayList<>();
        System.out.println("각각의 요소");
        for(int a=0; a<array.length; a++){

            array[a]=sc.nextInt();

            System.out.println(array[a]);


        }

        for(int a=0; a<commands.length; a++) {

            System.out.println("시작인덱스");
            int i = sc.nextInt();
            System.out.println("끝인덱스");
            int j = sc.nextInt();
            System.out.println("위치");
            int k = sc.nextInt();

            commands[a][0] = i;
            commands[a][1] = j;
            commands[a][2] = k;

            int[] newArr=Arrays.copyOfRange(array,i-1,j);


            Arrays.sort(newArr);



            list.add(newArr[k-1]);



        }

        int[] answer=new int[list.size()];

        for (int i=0; i<answer.length; i++){

            answer[i]=list.get(i);

        }

        return answer;
    }
}