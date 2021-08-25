<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	pageContext.setAttribute("str","학교종이 땡땡땡 어서 모이자 선생님이 우리를 기다리신다");
	pageContext.setAttribute("member","홍길동/베트맨/슈퍼맨/원더우먼/나그네");
%>
<hr>
${fn:contains(str,"어서") }<p>
${fn:contains(str,"핵교") }
<hr>
${fn:indexOf(str,"우리") }
<hr>
${fn:split(member,"/")[1] }<!-- member에 있는 값을 구분자(/)를 이용하여 값을 나누어서 배열에 저장하는 함수 -->
${fn:split(member,"/")[3] }<!-- member에 있는 값을 구분자(/)를 이용하여 값을 나누어서 배열에 저장하는 함수 -->
<hr>
<c:set var="mem" value="${fn:split(member,'/') }"/>
${mem[0] }<p>
${mem[2] }
<hr>
${fn:substring(str,3,6) }<p>
${fn:substringBefore(str,"땡땡땡") }<p>
${fn:substringAfter(str,"땡땡땡") }<p>
</body>
</html>