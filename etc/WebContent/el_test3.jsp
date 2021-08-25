<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	application.setAttribute("name", "슈퍼맨");	//모든 사용자
	session.setAttribute("name", "베트맨");	//사용자(브라우저)당 하나씩
	request.setAttribute("name", "홍길동");	//이전문서와 현재문서 사이에 존재
	pageContext.setAttribute("name","헨리");	//현재문서기준
	//el표현식으로 모두 호출할 수있고 작은 단위가 우선으로 호출된다.
	%>
</body>
</html>