<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String name = "홍길동";
	int age=44;
	
	application.setAttribute("name", "슈퍼맨");
	session.setAttribute("name", "베트맨");
	request.setAttribute("name", "원더우먼");
	pageContext.setAttribute("name", "뽀로로");
	
	String name =(String)session.getAttribute("name");
	
	pageContext.setAttribute("age",age);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %><!-- 홍길동 -->
${name }
${age }
</body>
</html>