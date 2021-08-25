<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* " %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
		
	//request받기
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "select * from student where id="+id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	function init(){
		document.stufrm.year.value="<%=rs.getString("hakbun").substring(1,3)%>";
		document.stufrm.ban.value="<%=rs.getString("hakbun").substring(3,5)%>";
	}
</script>
</head>
<body onload="init()">
<form name="stufrm" method="post" action="stu_update_ok.jsp">
	<input type="hidden" name="id" value="<%=rs.getString("id") %>">
	<input type="hidden" name="hakbun" value="<%=rs.getString("hakbun") %>">
	<table align="center">
		<caption> <h2> 학생 수정 </h2></caption>
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
			<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
		</tr>
		<tr>
			<td>태어난 해</td>
			<td><input type="text" name="birth" value="<%=rs.getString("birth") %>"></td>
		</tr>
		<tr>
			<td rowspan="3">주소</td>
			<td>
				<input type="text" name="zip" value="<%=rs.getString("zipNo")%>">
				<span id="btn1" onclick="juso_search()"> 우편번호찾기 </span>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="juso" value="<%=rs.getString("juso")%>"></td>
		</tr>
		<tr>
			<td><input type="text" name="juso_etc" value="<%=rs.getString("juso_etc")%>"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone" size="15" value="<%=rs.getString("phone")%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" name="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>