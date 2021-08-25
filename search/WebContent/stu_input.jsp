<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.juso_etc.focus();
      }
  }).open();
}
</script>
</head>
<body>
<div>
<form name="stufrm" method="post" action="stu_input_ok.jsp">
	<table align="center">
		<caption> <h2> 학생 입력 </h2></caption>
		<tr>
			<td> 학년 </td>
			<td>
				<select name="year" id="bb">
					<option value="03"> 3학년 </option>
					<option value="02"> 2학년 </option>
					<option value="01"> 1학년 </option>
				</select> 
			</td>
		</tr>
		<tr>
			<td> 반 </td>
			<td>
				<select name="ban" id="bb">
					<option value="01"> 1반 </option>
					<option value="02"> 2반 </option>
					<option value="03"> 3반 </option>
				</select> 
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>태어난 해</td>
			<td><input type="text" name="birth"></td>
		</tr>
		<tr>
			<td rowspan="3">주소</td>
			<td>
				<input type="text" name="zip">
				<span id="btn1" onclick="juso_search()"> 우편번호찾기 </span>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="juso"></td>
		</tr>
		<tr>
			<td><input type="text" name="juso_etc"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone" size="15"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" name="submit" value="입력"></td>
		</tr>
	</table>
	
</form>
</div>
</body>
</html>
<!--
create table student(
id int auto_increment primary key,
name char(10),
hakbun char(10),
birth date,
zip char(5),
juso varchar(50),
juso_etc varchar(50),
phone char(15),
writeday date
);
-->