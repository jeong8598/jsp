<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%	
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//쿼리생성
	String sql="select * from board2 order by id desc";
	
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs=stmt.executeQuery(sql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td {
    border:1px solid #cccccc;
    text-align:center;
	}
	a
	{
	text-decoration:none;
	color:black;
	}
</style>
</head>
<body>
<table align="center" width="800">
	<tr>
		<td width="70%"> 제목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
	</tr>
	<%
	while (rs.next())
	{
	%>
	<tr>
		<td> <a href="content.jsp?id= <%=rs.getInt("id") %>"><%=rs.getString("title") %> </a></td>
		<td> <%=rs.getString("name") %> </td>
		<td> <%=rs.getString("writeday") %> </td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="3"><a href="write.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>