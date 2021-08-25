<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
application 변수 : <%=application.getAttribute("name") %>
session 변수 : <%=session.getAttribute("name") %>
<!-- 
	다른 브라우저에서 접근하면 session은 null
	하나의 웹서버에는 하나의 application만 존재 ==> 모든 사용자가 접근할 수 있음
	session은 한 사용자(브라우저)당 하나씩 발생
-->
</body>
</html>