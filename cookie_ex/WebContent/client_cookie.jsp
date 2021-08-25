<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><!-- client_cookie.jsp =>자바스크립트로 쿠키생성하는 방법-->
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//쿠키만들기(변수이름(name),수명(max-age)) 수명은 동작안됨
	document.cookie="name=슈퍼맨;max-age=60";
	document.cookie="age=44;";
	function view()	//쿠키를 보기
	{
		document.getElementById("cook").innerText=document.cookie;
	}
	function del()	//쿠키를 삭제
	{
		//오늘 날짜를 만들어서 -1하여 어제로 바꾸어줌
		var today = new Date();
		today.setDate(today.getDate()-1);
		document.cookie="name=;expires="+today.toGMTString();
	}
</script>
</head>
<body>
<input type="button" onclick="view()" value="쿠키보기">
<input type="button" onclick="del()" value="쿠키삭제">
<p>
<span id="cook"></span>
</body>
</html>