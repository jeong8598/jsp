<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pwd);
	//쿼리생성
	String sql = "select * from board order by id desc";
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	//쿼리실행
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="board1.css">
</head>
<body>
<!-- 제목, 내용, 작성자, 비밀번호, 조회수 , 날짜 -->
<table width="600" align="center">
	<tr align="center">
		<td> 작성자 </td>
		<td> 제목 </td>
		<td> 조회수 </td>
		<td> 작성일 </td>
	</tr>
	<%
		while(rs.next()){
	%>
	<tr>
		<td align="center"> <%=rs.getString("name")%> </td>
		<td> <a href="readnum.jsp?id=<%=rs.getString("id")%>"> <%=rs.getString("title")%> </a></td>
		<td align="center"> <%=rs.getString("readnum")%> </td>
		<td align="center"> <%=rs.getString("writeday")%> </td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="4" id="right"> <a href="write.jsp"> 글쓰기 </a> </td>
	</tr>
</table>
</body>
</html>