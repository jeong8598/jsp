<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#loginBox{
width:500px;
height:320px;
top:50%;
left:50%;
position:absolute;
text-align:center;
border:1px solid #bbbbbb;
margin:-160px 0 0 -250px;
}
#loginBox #logo{
font-weight:900;
font-size:50px;
color:green;
margin:20px 0;
}
#loginBox input{
width:350px;
height:40px;
border:1px solid green;
font-size:20px;
margin:10px 0;
}
#loginBox #submit{
width:355px;
height:43px;
background:green;
color:white;
font-size:20px;
}
#chk {
color:red;
}
</style>
</head>
<body>
<div id="loginBox">
	<form method="post" action="login_ok.jsp">
		<div id="logo">LOGIN</div>
		<input type="text" name="userid" placeholder="아이디">
		<input type="password" name="pwd" placeholder="비밀번호">
		<button type="submit" id="submit">로그인</button>
		<%
		if(request.getParameter("chk")!=null)
		{
		%>
		<span id="chk">아이디 비밀번호를 확인하세요</span>
		<%
		}
		%>
	</form>
</div>
</body>
</html>