<%@page import="javacode.My"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 1.
	<%
		int kor = 90;
		int eng = 80;
		int math = 70;
		int total = kor+eng+math;
	%>
	<%=total %> 
--%>
<%--2.
	<%@page import="javacode.Test"%>
	<%=Test.haha() %>
--%>
<%=javacode.Test.haha() %>	<p><!-- 객체생성이전에 호출하여도 static메소드이브로 생성필요없음 -->
성적처리하기<p>
<%
	javacode.Test t = new javacode.Test();	//import안하면 패키지명을 다써야함
	My m = new My();	//import
%>
합계 : <%=t.hap() %><p>
출력: <%=m.print() %>
</body>
</html>