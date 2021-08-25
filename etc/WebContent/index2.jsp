<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" /><!-- jsp액션태그는 결과만을 불러온다는 의미라 변수를 사용할 수 없다. -->

인덱스 내용2
<%
	//out.print(name);
%>

<jsp:include page="bottom.jsp" />
</body>
</html>