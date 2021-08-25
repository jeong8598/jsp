package javacode;

public class My {
	public String print() {
		return "오늘은 월요일!";
	}
	public static int hap() {
		int hap = 0;
		for(int i=0 ; i<=100 ; i++) 
			hap+=i;
		return hap;
	}
	public int hap(int start, int end) {
		int hap = 0;
		for(int i=start ; i<=end ; i++) {
			hap+=i;
		}
		return hap;
	}
	public int hap(DTO d) {
		int hap = 0;
		int start = d.getStart();
		int end = d.getEnd();
		for(int i=start ; i<=end ; i++)
			hap+=i;
		return hap;
	}
}
