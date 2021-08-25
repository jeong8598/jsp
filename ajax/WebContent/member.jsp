<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		//아이디중복확인 버튼클릭 기능
		$("#dupId").click(function(){
			var id = $("#id").val();
			$.ajax({
				type:"post",
				url:"id_check.jsp?userid="+id,
				success:function(data){
					//동일아이디 없을 때
					if(data==0){
						$("#msg").text("사용가능 아이디입니다.").css("color","blue");
					//동일한 아이디 있을 때	
					}else if(data>0){
						$("#msg").text("이미 가입된 아이디입니다.").css("color","red");
					}
				}
			});
		});
	});
	/* 방법1.
	function check(){	//button에 onclick="check()"지정
		$.ajax({
			type:"get",
			url:"id_check.jsp",
			data: {userid:document.pkc.userid.value},
			success:function(data){
				if(data == 0)
					$("#msg").html("<span style='color:blue'>사용가능 아이디</span>");
				else
					$("#msg").html("<span style='color:red'>사용 불가능 아이디</span>");
			}
		});	   
	}
		방법2.
	var chk=new XMLHttpRequest();	//객체생성
	
	// 사용자의 이벤트가 실행되었을때   => background에서 서버를 다녀오는것(jsp문서를 호출)
	function check()
	{
		//여기서 userid값을 가져와야한다.
		var userid = document.pkc.userid.value;
		chk.open("get","id_check.jsp?userid="+userid);
		chk.send();	//서버에 전송됨 => target.jsp를 get방식으로 호출
	
		chk.onreadystatechange=function(){	//0~4
			if(chk.readyState==4){// 완료되었다면 
				if(chk.responseText == 0){
					document.getElementById("msg").innerText="사용가능 아이디";
				}else{
					document.getElementById("msg").innerText="사용 불가능 아이디"; 
				}
			}
		}
	}
	*/
</script>
</head>
<body>
<!-- 회원가입폼 -->
<form name="join">
	<table>
		<tr>
			<td> 아이디 </td>
			<td>
				<input type="text" name="userid" id="id"> 
				<input type="button" id="dupId" value="중복확인">
				<span id="msg"></span>
			</td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="userid"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd"> </td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="가입하기"> </td>
		</tr>
	</table>
</form>
</body>
</html>