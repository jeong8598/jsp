<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- el표현식은 내부에서 연산 처리 가능 -->
<%
	pageContext.setAttribute("kor",100);
	pageContext.setAttribute("eng",80);
	out.print(pageContext.getAttribute("kor"));
	String name = request.getParameter("kor");
%>
* 출력	:	${kor } , ${eng }<p>
* 더하기	:	${kor+10 } ${eng+10 }<p>
* 나머지	:	${kor%9 } ${eng mod 7 }<p>
* 비교 *<p>
크다	: ${kor>eng } ${eng gt kor }<p><!-- great than -->
작다	:	${kor<eng }	${eng lt kor }<p><!-- less than -->
크거나같다	:	${kor>=eng }	${eng ge kor }<p><!-- great equal -->
작거나같다	:	${kor<=eng }	${eng le kor }<p><!-- less equal -->
같지않다:	${kor != eng }	${kor ne eng }<p><!-- not equal -->
조건	:	${kor>=80 ? "합격":"불합격" }
</body>
</html>