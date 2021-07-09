package leetcode;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class TwoSum {

    public static  int[] twoSum(int[] nums, int target) {

        int sum=0;

        int[] answer= new int[2];

        for(int i=0; i<nums.length;i++){

            for(int j=i+1; j<nums.length; j++){

                sum=nums[i]+nums[j];

                if(sum==target){

                    answer[0]=i;
                    answer[1]=j;

                }

            }

        }

        return answer;
    }

    public static void main(String[] args) {

        int[] nums=new int[]{2,7,11,15};

        int target=13;

       int[] answer =twoSum(nums,target);


    }


}
