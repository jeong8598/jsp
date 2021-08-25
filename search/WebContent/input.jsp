<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" method="post" action="input_ok.jsp?">
	<table align="center">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>국어</td>
			<td><input type="text" name="kor"></td>
		</tr>
		<tr>
			<td>영어</td>
			<td><input type="text" name="eng"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="math"></td>
		</tr>
		<tr>
			<td>과학</td>
			<td><input type="text" name="sci"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="입력">
			</td>
		</tr>
	</table>
</form>
<!-- create table score(
id int auto_increment primary key,
name char(5),
kor int,
eng int,
math int,
sci int,
writeday date
); -->
</body>
</html>