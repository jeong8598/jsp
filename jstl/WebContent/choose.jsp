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
<%
	int sel = 5;
	//1.짜장면, 2.짬뽕, 3.탕수육, 4.팔보채, 5.전가복, 6.마라탕
	pageContext.setAttribute("sel",sel);
	switch(sel){
	case 1: out.print("짜장면 주문"); break;
	case 2: out.print("짬뽕 주문"); break;
	case 3: out.print("탕수육 주문"); break;
	case 4: out.print("팔보채 주문"); break;
	case 5: out.print("전가복 주문"); break;
	case 6: out.print("마라탕 주문"); break;
	default: out.print("몰랑"); break;
	}
%>
<hr>
<c:choose>
	<c:when test="${sel eq 1 }">
	짜장면 주문
	</c:when>
	<c:when test="${sel eq 2 }">
	짬뽕 주문
	</c:when>
	<c:when test="${sel eq 3 }">
	탕수육 주문
	</c:when>
	<c:when test="${sel eq 4 }">
	팔보채 주문
	</c:when>
	<c:when test="${sel eq 5 }">
	전가복 주문
	</c:when>
	<c:when test="${sel eq 6 }">
	마라탕 주문
	</c:when>
	<c:otherwise>
	몰랑
	</c:otherwise>
</c:choose>
<hr>

<c:if test="${sel eq 1 }">
짜장면 주문
</c:if>
<c:if test="${sel eq 2 }">
짬뽕 주문
</c:if>
<c:if test="${sel eq 3 }">
탕수육 주문
</c:if>
<c:if test="${sel eq 4 }">
팔보채 주문
</c:if>
<c:if test="${sel eq 5 }">
전가복 주문
</c:if>
<c:if test="${sel eq 6 }">
마라탕 주문
</c:if>
<hr>
<%
	String[] menu={"짜장면","짬뽕","탕수육","팔보채","전가복","마라탕"};
	pageContext.setAttribute("menu",menu);
%>
<c:forEach var="i" begin="1" end="6">
	<c:if test="${sel eq i }">
		${menu[i-1] } 주문
	</c:if>
</c:forEach>
</body>
</html>