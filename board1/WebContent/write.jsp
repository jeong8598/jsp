<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <!-- write.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(my){
	if(my.name.value.length<3 || my.name.value.length>=5){
		alert("이름은 3자이상 5자 이하로 입력해주세요");
		return false;
	}else if(isNaN(my.age.value) || my.age.value.length==0){
		alert("나이는 숫자로 입력해주세요");
		return false;
	}else if(my.juso.value.length<2){
		alert("주소는 2글자 이상 입력해주세요");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<!-- 이름은 3자이상 5자이하, 나이는 숫자인가, 주소는 2자 이상 되면 전송하기 -->
<form name="pkc" method="post" action="write_ok.jsp" onsubmit="return check(this)">
	 이름 <input type="text" name="name"> <p>
	나이 <input type="text" name="age"> <p>
	주소 <input type="text" name="juso"> <p>
	<input type="submit" value="저장">
</form>
</body>
</html>