<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var a=100; //전역변수
var b=100;
function aa()
{
	var a=99;	//현재영역안에서 만들어진 지역변수
	b=77;
}
aa();
alert(a+""+b);	/* 전역변수 a,b를 실행 */
function bb()
{
	c=88;
}
bb();
alert(c);
//var 은 변수 만들때 앞에 적는 키워드
//함수 밖에서는 있으나 없으나 동일하게 인식
//함수 내에서 var이 있으면 함수 내에서만 인식하는 지역변수 var없이 생성되면 전역변수
</script>
</head>
<body>

</body>
</html>