<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javacode.BoardDTO" %>
<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	BoardDTO d=new BoardDTO();
	d.setTitle(title);
	d.setName(name);
	d.setContent(content);
	d.setPwd(pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제목: <%=d.getTitle() %><p>
작성자: <%=d.getName() %><p>
내용: <%=d.getContent() %><p>
</body>
</html>