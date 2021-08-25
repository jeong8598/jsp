<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javacode.My" %>
<!DOCTYPE html>
<html>
<head><!-- test3_ok.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//request사용
	//시작값~끝값의 합을 구하기
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	
	My m = new My();
	int hap = m.hap(start,end);
	
	%>
	<%=start %>에서 <%=end %>까지의 합 : <%=hap %>
</body>
</html>