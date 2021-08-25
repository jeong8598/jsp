package javacode;

public class Test {
	public int hap() {
		int kor = 90;
		int eng = 80;
		int math = 70;
		int total = kor+eng+math;
		return total;
	}
	//static method => new 객체생성 없이 호출할 수 있음
	//스택영역에 바로 메모리 올라감
	public static String haha() {
		return "static 메서드 호출";
	}
}
