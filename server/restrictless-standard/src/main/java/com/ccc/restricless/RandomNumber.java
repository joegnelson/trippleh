package com.ccc.restricless;

import java.util.Random;

public class RandomNumber {

	public static int  count1;
	public static int  count2;
	public static int  count3;
	public static int  count4;
	public static int  countERROR;
	
	public static String generateNumber() {
		Random rand = new Random();

		int  n = rand.nextInt(9999) ;
		if(n<10) {
//			count1++;
			return "000"+n;
		}
		if(n<100) {
//			count2++;
			return "00"+n;
		}
		if(n<1000) {
//			count3++;
			return "0"+n;
		}
		if(n<10000) {
//			count4++;
			return ""+n;
		}
		
//		countERROR++;
		System.out.println("LOGICAL ERROR generateNumber="+n);
		return "9182";
		
	}
	public static void main(String[] args) {
		for(int i=0;i<10000;i++) {
			System.out.println(generateNumber()+"-"+i+"");
		}
		System.out.println();
		System.out.println(count1);
		System.out.println(count2);
		System.out.println(count3);
		System.out.println(count4);
		System.out.println(countERROR);
	}
}
