<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><!-- ajax.jsp -->
<body>
<script>
	// 방식1
	var chk = new XMLHttpRequest();	//객체생성
	//사용자의 이벤트가 실행됐을때 -> background에서 서버를 다녀오는 것(jsp 문서 호출)
	function check(){
		chk.open("get","target.jsp");
		chk.send();	//서버에 전송됨 => target.jsp를 get방식으로 호출
		chk.onreadystatechange = function(){
			if(chk.readyState ==4){	//완료되었다면
				document.getElementById("aa").innerText = chk.responseText.trim();
				//alert(chk.responseText);	//출력값을 모두 가져옴
				/* if(chk.responseText.trim() =="1")	//trim공백제외
					document.getElementById("aa").innerText="가능합니다.";
				else
					document.getElementById("aa").innerText="불가능합니다."; */
			}
		}
	}
	/* 방식2-1 $("#btn").on("click",function(){}); */
	/* 방식2-2
	function check(){
		$.ajax({
			type:"get",
			url:"target.jsp",
			success:function(data){
				$("#aa").text(data);
			}
		});
	}
	*/
</script>
<input type="button" onclick="check()" value="호출">
<span id="aa"></span>
</body>
</html>