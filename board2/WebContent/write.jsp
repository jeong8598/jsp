<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="board1.css">
<script type="text/javascript" src="board1.js"></script>
</head>
<body>
<form name="frm" method="post" action="write_ok.jsp" onsubmit="return check(this)">
	<table width="600" align="center">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr>
			<td> 제 목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 작성자 </td>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="50" rows="4" name="content"> </textarea></td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd"> </td>
		</tr>
		<tr>
			<td> 비밀번호확인 </td>
			<td> 
				<input type="password" name="pwd2" onkeyup="pwdMsg(this.form)">
				<span id="msg"></span> 
			</td>
		</tr>
		<tr>
			<td colspan="2"><button id="btn"> 저장하기 </button></td>
		</tr>
	</table>
</form>
</body>
</html>