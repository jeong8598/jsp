package sungjuk;

public class Sung {
	public static String sungjuk(int s)
    {
	   String sung=null;
	   if(s>=90)
		   sung="A";
	   else if(s>=80)
		      sung="B";
	        else if(s>=70)
		           sung="C";
	             else if(s>=60)
		                sung="D";
	                  else
		                sung="F";
	   return sung;
    }
}
