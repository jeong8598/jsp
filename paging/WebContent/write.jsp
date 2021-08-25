<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pager = 0;
	if(request.getParameter("pager")==null){
		pager=1;
	}else{
		pager=Integer.parseInt(request.getParameter("pager"));
	}
	pageContext.setAttribute("pager",pager);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=text]{
width:350px;
}
input[type=password]{
width:250px;
}
#btn{
text-align:center;
}
input[type=submit]{
background:white;
height:30px;
margin-right:10px;
border:1px solid #A9A9A9;
font-size:15px;
}
#cBtn{
width:40px;
height:28px;
display:inline-block;
border:1px solid #A9A9A9;
line-height:28px;
}
a{
text-decoration: none;
color:black;
}
</style>
</head>
<body>
<form name="frm" method="post" action="write_ok.jsp" onsubmit="return chkData();">
	<table align="center" width="600">
		<caption> <h3> 글 쓰 기 </h3></caption>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" autocomplete="off"></td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd" placeholder="4~12자의 영문 대소문자로 입력해주세요." autocomplete="off"></td>
		</tr>
		<tr>
			<td> 비밀번호 확인 </td>
			<td> <input type="password" name="pwd1" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="50" rows="4" name="content" autocomplete="off"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2" id="btn"> 
				<input type="submit" value="글쓰기">
				<div id="cBtn"><a href="list.jsp?pager=${pager }"> 취소 </a></div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>