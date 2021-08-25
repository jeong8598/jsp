<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    // setTimeout, setInterval => 특정시간후에 기능(함수)를 호출하는 메소드
    function show(){
        alert("안녕하세요");
    }
    function win_open(){
    	window.open("","","width=100,height=100");
    }
    //setTimeout(show,3000); // setTimeout(함수,시간) => 시간후에 함수를 실행하라 (1번 실행)
    // setInterval(show,3000); // setInterval(함수,시간)  => 시간후에 함수를 실행하라 (무한반복)
    //setInterval(win_open,1000)
  </script>
</head>
<body> 
</body>
</html>