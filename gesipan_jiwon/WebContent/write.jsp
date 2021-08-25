<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function list(){
		location="list.jsp";
	}
</script>
</head>
<body>
<form name="board" method="post" action="write_ok.jsp">
	<table align="center" width="600">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" size="50"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" id="birth"></td>
		</tr>
		<tr>
			<td>성별</td>
		    <td> 
				<input type="radio" name="sung" value="0">남자 
		       	<input type="radio" name="sung" value="1">여자
		    </td>
		<tr>
			<td>내용</td>
			<td><textarea cols="60" rows="4" name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시 쓰기">
			<button type="button" onclick="list()">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<!-- 
create table board2(
id int auto_increment primary key,
title varchar(30),
name char(5),
birth date,
sung int,
content text,
writeday date);



 -->
