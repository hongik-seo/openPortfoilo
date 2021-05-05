package programmers;

import java.util.*;

class Solution4 {

    public String solution(String[] participant, String[] completion) {

        String answer = "";

        participant = new String[]{"marina", "josipa", "nikola", "vinko", "filipa"};

        completion = new String[]{"josipa", "filipa", "marina", "nikola"};

        HashMap<String, String> map = new HashMap<>();


        for (int i = 0; i < participant.length; i++) {

            map.put(participant[i],participant[i]);


        }

        for(int i =0; i<completion.length; i++){

            map.remove(completion[i],completion[i]);

            if(map.isEmpty()){

                map.putIfAbsent(participant[i],participant[i]);

            }
        }

        System.out.println(map);

        answer=map.keySet().iterator().next();
        return answer;

    }

}

class Maraton {


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        Solution4 solution4 = new Solution4();

        String[] participant=null;

        String[] completion=null;

        Solution4 sol=new Solution4();

        System.out.println(sol.solution(participant,completion));





    }

}
