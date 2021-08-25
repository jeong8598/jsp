<%@page import="java.sql.ResultSet"%>
<%@page import="board.DB_Conn"%>
<%@page import="board.dto.BoardDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request가져오기
	String id = request.getParameter("id");
	
	//DB_Conn 클래스에서 content()실행
	DB_Conn db =new DB_Conn();
	//ResultSet rs = db.content(id);
	//rs.next();
	BoardDto bdto = db.content(id);
	pageContext.setAttribute("bdto",bdto);
%>
<%=board.Etc.nalja()%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 출력 -->
<table width="600" align="center">
	<tr>
		<td>제목</td>
		<td colspan="3"><%=bdto.getTitle() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td colspan="3"><%=bdto.getName() %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=bdto.getReadnum() %></td>
		<td>작성일</td>
		<td><%=bdto.getWriteday()%></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><%=bdto.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<a href="update.jsp?id=<%=id %>">수정</a>
			<a href="delete.jsp?id=<%=id %>">삭제</a>
			<a href="list.jsp">목록</a>
		</td>
	</tr>
</table>
</body>
</html>