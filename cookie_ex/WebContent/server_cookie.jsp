<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//server가 client에 요청 =>response
	//client가 server에 요청 =>request
	Cookie cookie = new Cookie("name","홍길동");	//cookie라는 객체
	cookie.setMaxAge(600);	//초단위
	response.addCookie(cookie);	//클라이언트에 쿠키변수를 저장
	
	cookie = new Cookie("age","33");
	cookie.setMaxAge(600);
	response.addCookie(cookie);
	
%>
<!DOCTYPE html>
<html>
<head><!-- server_cookie.jsp =>jsp로 쿠키를 생성하는 방법 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>