package programmers;

import java.util.*;

class Solution4 {

    public String solution(String[] participant, String[] completion) {

        String answer = "";

        participant = new String[]{"mislav", "stanko", "mislav", "ana"};

        completion = new String[]{"stanko", "ana", "mislav"};

        Arrays.sort(participant);

        Arrays.sort(completion);

        for(int i=0; i<completion.length; i++){

            if(!participant[i].equals(completion[i])){

                answer= participant[i];
                return answer;
            }

        }

        return participant[participant.length-1];

    }

}

class Marathon {


    public static void main(String[] args) {



        Solution4 solution4 = new Solution4();

        String[] participant=null;

        String[] completion=null;

        Solution4 sol=new Solution4();

        System.out.println(sol.solution(participant,completion));





    }

}
