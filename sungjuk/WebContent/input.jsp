<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(my){
	if(my.name.value.length==0){ // form.name.value.length==""
		alert("이름을 입력하세요");
		return false;
	}
	if(!ischeck(my.kor.value.trim())){	/* trim()=>스페이스 빈문자를 없애주는 역할 */
		alert("국어점수를 1~100사이의 숫자로 입력하세요");
		return false;
	}
	if(!ischeck(my.eng.value.trim())){
		alert("영어점수를 1~100사이의 숫자로 입력하세요");
		return false;
	}
	if(!ischeck(my.math.value.trim())){
		alert("수학점수를 1~100사이의 숫자로 입력하세요");
		return false;
	} 
	if(!ischeck(my.sci.value.trim())){
		alert("과학점수를 1~100사이의 숫자로 입력하세요");
		return false;
	}
	return true;
}
function ischeck(jumsu){
	if(jumsu<0 || jumsu>100 || isNaN(jumsu) || jumsu.length==0){
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form id="frm" method="post" action="input_ok.jsp" onsubmit="return check(this);">
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
</body>
</html>
<!-- create table score(
id int auto_increment primary key,
name char(5),
kor int,
eng int,
math int,
sci int,
writeday date
); -->