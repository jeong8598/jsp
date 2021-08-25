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
	
	//request값 읽어오기
	String id=request.getParameter("id");
	//쿼리문생성
	String sql = "select * from board2 where id="+id;
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	//성별
	String sung=null;
	switch(rs.getInt("sung"))
	{
	case 0:sung="남자"; break;
	case 1:sung="여자"; break;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="600">
	<tr>
		<td>제목</td>
		<td colspan="5"><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=rs.getString("name") %></td>
		<td>생년월일</td>
		<td><%=rs.getString("birth")%></td>
		<td>성별</td>
		<td><%=sung %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="5"><%=rs.getString("content")%></td>
	</tr>
	<tr>
		<td colspan="5" align="center">
		<a href="update.jsp?id=<%=rs.getInt("id") %>"> 수정 </a>
		<a href="delete.jsp?id=<%=rs.getInt("id") %>"> 삭제 </a>
		<a href="list.jsp"> 목록 </a>
	</tr>
</table>

</body>
</html>