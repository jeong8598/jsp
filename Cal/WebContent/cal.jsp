<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.time.LocalDate" %>
<%
//달력을 만들기 위해 필요한 값 => 해당월의 총 일수,해당월의 1일의 요일, 해당월의 주 수
	LocalDate today=LocalDate.now();	//현재시간
	double chong=today.lengthOfMonth();	//총 일수를 구하는 메소드
	
	int y = today.getYear();
	int m = today.getMonthValue();
	
	//1일의 요일을 구하기 위해 ?년?월 1일에 대한 날짜 객체를 생성
	LocalDate dday = LocalDate.of(y,m,1);	//of(y,m,d) =>해당 년,월,일의 객체가 생성
	
	int	yoil=dday.getDayOfWeek().getValue();	//요일의 값을 숫자로 1:월요일~7:일요일
	if(yoil==7)
		yoil=0; //일요일을 0으로 만들어 사용
	int ju = (int)Math.ceil((chong+yoil)/7);	//(31+2)/7 =>4.xx
	out.print(ju);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" height="300" border="1">
	<tr>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td>토</td>
		<td>일</td>
	</tr>
	<%
	int day=1; //td안에 출력할 날짜변수
	for(int i=1;i<=ju;i++)
	{
	%>
	<tr>
	<%
		for(int j=0;j<7;j++)	//yoil변수와 값은 j변수와 동일하게 움직인다.
		{		//1행의 빈칸			//총일수보다 큰값
			if( (j<yoil && i==1) || (chong<day) )
			{		
	%>
		<td>&nbsp;</td><!-- 값이 출력되지 않는 td j의 값이 yoil보다 작을때 -->
	<%
			}
		
			else
			{
	%>
		<td><%=day %> </td>
	<%
			day++;
			}
		}
	%>
		</tr>
	<%
	}
	%>

</table>
</body>
</html>