<%@page import="java.sql.ResultSet"%>
<%@page import="board.DB_Conn"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB 연결 - DB_Conn.java통해 Connection 객체 생성
	DB_Conn db = new DB_Conn();
	
	//requset값 가져오기
	String id = request.getParameter("id");
	
	//DB_Conn 클래스에서 content() 실행
	BoardDto bdto= db.content(id);
	
%>
<!DOCTYPE html>
<html>
<head><!-- write.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="update_ok.jsp">
	<input type="hidden" name="id" value="<%=id %>">
	<table width="600" align="center">
	<caption><h3>글수정</h3></caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" size="40" value="<%=bdto.getTitle()%>"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=bdto.getName()%>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="40" rows="4" name="content"><%=bdto.getContent()%></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>