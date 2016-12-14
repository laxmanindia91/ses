package netscript.servlet;

import java.util.Random;

public class Test {

	public static void main(String[] args) {
	int[] nums={5,77,66,55,12,99,100,101,33,12,13,14,15,16,17,18,19,23,34,45,56,97,65,43,21};
int index=0;
	Random rb=new Random();
	for(int i=1;i<=4;i++)
	{
		index=rb.nextInt(nums.length-1);
		System.out.print(nums[index] +" ");
		
	}
	
	}

}
