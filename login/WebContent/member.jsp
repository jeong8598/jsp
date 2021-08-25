<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")==null){
		response.sendRedirect("login.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head><!-- member.jsp : 회원만 볼 수 있다.(로그인해야 볼수있다) -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기는 회원만 볼 수 있는 문서입니다.
</body>
</html>
<%
	}
%>