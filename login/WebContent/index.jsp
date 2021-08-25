<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
width:900px;
margin:0 auto;
}
#first{
height:30px;
background:purple;
color:white;
text-align:center;
}
#second{
height:50px;
}
#second #left{
float:left;
}
#second #right{
float:right;
}
</style>
</head>
<body>
<div id="container">
	<div id="first"> 친구 추천을 하면 1억을 드립니다. </div>
	<div id="second">
		<div id="left"> 로고 <%=application.getAttribute("name") %></div>
		<div id="right">
		<%
			if(session.getAttribute("userid")==null){
		%>
			<a href="login.jsp"> 로그인 </a>
		<%
			}else{
		%>
			<%=session.getAttribute("userid") %> 님 환영합니다!
			<a href="logout.jsp"> 로그아웃 </a>
		<%
			}
		%>
		</div>
	</div>
</div>
</body>
</html>