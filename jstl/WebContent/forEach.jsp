<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.aa	{
width:300px;
border:1px solid red;
}
</style>
</head>
<body>
<div class="aa">
	<%
		for(int i=1 ; i<=10 ; i++){
			out.print("하하하!<br>");
		}
	%>
	<hr>
	<c:forEach var="k" begin="1" end="10" step="1">
		호호호!<br>
	</c:forEach>
</div>

<hr>

<div class="aa">
	<%
		String[] member = {"홍길동","베트맨","슈퍼맨","뽀로로","원더우먼"};
		pageContext.setAttribute("member",member);
		
		for (String name:member){
			out.print(name+"<p>");
		}
		out.print("<hr>");
	%>
	<c:forEach items="${member }" var="name">
		${name }<p>
	</c:forEach>
</div>

<hr>

<div class="aa">
	<select>
	<!-- 1900 부터 시작 -->
	<c:forEach var="i" begin="1900" end="2020">
		<option value=${i }>${i }</option>
	</c:forEach>
	</select>
	<hr>
	<select>
	<!-- 2020 부터 시작 -->
	<c:forEach var="i" begin="0" end="120">
		<option value=${2020-i }>${2020-i }</option>
	</c:forEach>
	</select>
</div>
</body>
</html>