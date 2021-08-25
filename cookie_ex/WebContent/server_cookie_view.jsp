<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><!-- server_cookie_view.jsp =>쿠키읽어오기 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키읽어오기
	Cookie[] cookie=request.getCookies();	//쿠키요소들을 배열로 
	// out.print(cookie.length);
	for(int i=0 ; i<cookie.length ; i++)
	{
		out.print(cookie[i].getName());
		out.print(cookie[i].getValue());
		out.print("<p>");
		// 0번방은 index값이므로 신경쓰지 않기
		//값은 1번부터 저장되어 있다는 것
		//JSESSIONID 톰캣에서 발행되는 세션관리 키값
	}
%>
<form method="post" action="server_cookie_del.jsp">
	삭제할 쿠키명 <input type="text" name="cname"><br>
	<input type="submit" value="쿠키삭제">
</form>
<hr>
<form method="post" action="server_cookie_add.jsp">
	생성할 쿠키명 <input type="text" name="cname"><br>
	쿠키의 값 <input type="text" name="cvalue"><br>
	<input type="submit" value="쿠키생성">
</form>
</body>
</html>