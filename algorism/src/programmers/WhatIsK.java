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

        String sum="";
        CharSequence charSequence="";


        Set<Integer> set=new LinkedHashSet<>();
        System.out.println("각각의 요소");
        for(int a=0; a<array.length; a++){

            array[a]=sc.nextInt();

            sum+=array[a];

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

            charSequence = sum.subSequence(i - 1, j);

            char[] chars = String.valueOf(charSequence).toCharArray();

            Arrays.sort(chars);

            for (int b=0; b<chars.length; b++){

                int tt=chars[k-1]-48;

                set.add(tt);



            }

        }

        int[] answer=new int[set.size()];

        Iterator<Integer> iterator = set.iterator();

        for (int i=0; i<answer.length; i++){

            answer[i]=iterator.next();

            System.out.println(answer[i]);

        }

        return answer;
    }
}