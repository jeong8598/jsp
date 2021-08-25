<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1부터 100까지 합구하기
<%=javacode.My.hap() %><p>
<%
	int hap = 0;
	for(int i=1 ; i<=100 ; i++)
		hap += i;
%>
<%=hap %>
</body>
</html>