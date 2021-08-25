<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=text]{
margin:auto;
width:350px;
}
tr{
height:60px;
}
td:first-child{
text-align:center;
}
#btn{
width:200px;
height:40px;
background:pink;
border:1px solid orange;
}
</style>
<script>
function check(my){
	if(!chkNull(my.title,"제목을")){
		return false;
	}
	if(!chkNull(my.name,"이름을")){
		return false;
	}
	if(!chkNull(my.content,"내용을")){
		return false;
	}
	if(!chkPwd(my.pwd,my.pwd2)){
		return false;
	}
	return true;
}

function chkPwd(pwd,pwd2){
	if(!chkNull(pwd,"비밀번호를")){
		return false;
	}
	if(!chkNull(pwd2,"비밀번호 확인을")){
		return false;
	}
	if(pwd.value != pwd2.value){
		return false;
	}
	return true;
}
//공백체크
function chkNull(str,msg){
	if(str.value == null || str.value == ""){
		alert(msg+" 입력하세요");
		str.focus();
		return false;
	}
	return true;
}
//비밀번호 확인 입력 후 일치하는지 체크
function pwdMsg(my){
	if(my.pwd.value != my.pwd2.value){
		document.getElementById("msg").innerText="<b>비번이 틀립니다</b>";
		// $("#msg").text("비번이틀립니다");
		document.getElementById("msg").style.color="red";
		return false;
	}
	if(frm.pwd.value == frm.pwd2.value){
		document.getElementById("msg").innerHTML="<b>비번이 일치합니다</b>";
		document.getElementById("msg").style.color="blue";
		return true;
	}
}
</script>
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