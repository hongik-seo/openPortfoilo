package leetcode;

import java.util.HashMap;

public class TwoSum2 {

    public static  int[] twoSum2(int[] nums, int target) {

        int sum1=0;
        int sum2=0;
        int sum3=0;
        int sum4=0;
        int[] answer= new int[2];

        for(int i=0, j=i+1 ,k=nums.length-j; j<nums.length; i++,j++,k-- ){

            sum1=nums[i]+nums[j];

            sum2=nums[0]+nums[k];

            sum3=nums[j]+nums[k];

            sum4=nums[i]+nums[nums.length-1];

            if(target==sum1){

                answer[0]=i;
                answer[1]=j;
                break;
            }

            if(target==sum2){

                answer[0]=0;
                answer[1]=k;
                break;
            }

            if(target==sum3){

                answer[0]=j;
                answer[1]=k;
            }

            if(target==sum4){

                answer[0]=i;
                answer[1]=nums.length-1;
                break;

            }


        }

        return answer;
    }

    public static void main(String[] args) {

        int[] nums=new int[]{-3,2,3};

        int target=0;

       int[] answer =twoSum2(nums,target);


       for(int i=0; i<answer.length; i++){

           System.out.println(answer[i]);
       }

    }


}
