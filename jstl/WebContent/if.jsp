<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<!-- if문에 해당하는 코어태그 -->
<!-- core 태그 if --><!-- else문이 없음 -->
<%
	int age = 15;
	pageContext.setAttribute("age",age);
%>
<c:if test="${age>=20 }"><!-- 20보다 크거나 같다에 만족하는 조건 -->
	어서오세요?
</c:if>
<c:if test="${age<20 }"><!-- 20보다 크거나 같다에 만족하지 않는 조건 -->
	커서오세요?
</c:if>

<%
	if(age>=20){
%>	
	어서오세요
<%
	}else{
%>
	커서오세요
<%
	}
%>
</body>
</html>