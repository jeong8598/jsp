<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%	//투표결과의 값을 가져와서 화면에 뿌려줌
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//쿼리작성
	String sql = "select a1,a2,a3,a4,a5,a6,a7,(a1+a2+a3+a4+a5+a6+a7) as hap from vote where id=1";
    
    //심부름꾼
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    //투표값 결과값을 확인하기 위한 값
    //전체투표자수 각투표자수
    double hap = rs.getInt("hap");
    int a1 = (int)((rs.getInt("a1")/hap)*100);
    int a2 = (int)((rs.getInt("a2")/hap)*100);
    int a3 = (int)((rs.getInt("a3")/hap)*100);
    int a4 = (int)((rs.getInt("a4")/hap)*100);
    int a5 = (int)((rs.getInt("a5")/hap)*100);
    int a6 = (int)((rs.getInt("a6")/hap)*100);
    int a7 = (int)((rs.getInt("a7")/hap)*100);

    //화면에 나타낼때 =>막대그래프 크기가 투표수에 따라 달라진다. 투표의  %단위를 표시하기도 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.anju{
	/* width:400px; */
	display:inline-block;
	height:10px;
	background:red;
	}
</style>
</head>
<body>
	<table width="500" align="center">
		<tr>
			<td>대방어</td>
			<td><span class="anju" style="width:<%=a1 %>px"></span></td>
			<td><%=a1 %>%</td>	<!--  -->
		</tr>
		<tr>
			<td>돌돔</td>
			<td><span class="anju" style="width:<%=a2 %>px"></span></td>
			<td><%=a2 %>%</td>
		</tr>
		<tr>
			<td>감성돔</td>
			<td><span class="anju" style="width:<%=a3 %>px"></span></td>
			<td><%=a3 %>%</td>
		</tr>
		<tr>
			<td>참돔</td>
			<td><span class="anju" style="width:<%=a4 %>px"></span></td>
			<td><%=a4 %>%</td>
		</tr>
		<tr>
			<td>벵애돔</td>
			<td><span class="anju" style="width:<%=a5 %>px"></span></td>
			<td><%=a5 %>%</td>
		</tr>
		<tr>
			<td>자리돔</td>
			<td><span class="anju" style="width:<%=a6 %>px"></span></td>
			<td><%=a6 %>%</td>
		</tr>
		<tr>
			<td>옥돔</td>
			<td><span class="anju" style="width:<%=a7 %>px"></span></td>
			<td><%=a7 %>%</td>
		</tr>
	</table>
</body>
</html>