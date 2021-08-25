<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="top.jsp" %><!-- 자바include는 top.jsp를 그대로 복붙했다는 의미라 변수를 사용할 수 있다-->

인덱스 내용
<%
	out.print(name);	
%>
<%@ include file="bottom.jsp" %>
</body>
</html>