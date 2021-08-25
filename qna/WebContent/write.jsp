<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="qna.js"></script>
<style>
input[type=text], input[type=password]{
width:400px;
}
input[type=password]{
width:250px;
}
</style>
</head>
<body>  <!-- 질문글을 만드는 폼으로 seq,depth,grp가 필요없다... -->
<form name="frm" method="post" action="write_ok.jsp" onsubmit="return chkData();">
	<table align="center" width="600">
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" onkeydown="chkSpacebar();"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd" placeholder=" 4~12자의 영문 대소문자로 입력해주세요." onkeydown="chkSpacebar();"> </td>
		</tr>
		<tr>
			<td> 비밀번호 확인 </td>
			<td> <input type="password" name="pwd1" onkeydown="chkSpacebar();"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="60" rows="4" name="content"></textarea> </td>
		</tr>
		<tr>
			<td> <input type="submit" value="질문저장"> </td>
			<td><a href="list.jsp"> 목록 </a></td>
		</tr>
	</table>
</form>
</body>
</html>










