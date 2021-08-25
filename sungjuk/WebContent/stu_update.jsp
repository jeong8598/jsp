<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
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
<script>
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/search/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
/* //생년월일 4자리,숫자인지
function inNumber(num){
    if(event.keyCode<48 || event.keyCode>57 || num.value.length>7){
       event.returnValue=false;
    }
} */

function init(){
	document.form.grade.value="<%=rs.getString("hakbun").substring(1,3)%>";
	document.form.ban.value="<%=rs.getString("hakbun").substring(3,5)%>";
	document.form.year.value = "<%=rs.getString("birth").substring(0,4)%>";
	var month = "<%=rs.getString("birth").substring(5,7)%>";
	var day = "<%=rs.getString("birth").substring(8,10)%>";
	if(month[0]==0){
		document.form.month.value = month[1];
	}else{
		document.form.month.value = month;
	}
	if(day[0]==0){
		document.form.day.value = day[1];
	}else{
		document.form.day.value = day;
	}
}
function check(){
	if($("#aa").val()==""){
		alert("학년을 선택해주세요");
		return false;
	}
	if($("#bb").val()==""){
		alert("반을 선택해주세요");
		return false;
	}
	if($("#name").val().trim()=="" || $("#name").val().trim()==null){
		alert("이름을 입력하세요");
		return false;
	}
	if($("#year").val()==""){
		alert("생년월일을 선택하세요");
		return false;
	}
	if($("#month").val()==""){
		alert("생년월일을 선택하세요");
		return false;
	}
	if($("#day").val()==""){
		alert("생년월일을 선택하세요");
		return false;
	}
	if($("#zipNo").val()==""){
		alert("주소를 입력하세요");
		return false;
	}
	if($("#phone").val()==""){
		alert("연락처를 입력하세요");
		return false;
	}
		return true;
}
function backToList(){
	location = "stu_list.jsp";
}

</script>
</head>
<body onload="init()">
<form name="form" id="form" method="post" action="stu_update_ok.jsp" onsubmit="return check()">
<input type="hidden" name="id" value="<%=id %>">
<table width="800" align="center">
	<caption><h2> 학생입력 </h2></caption>
	<tr>
		<td> 학년 </td>
		<td>
			<select name="grade" id="aa">
				<option value=""> --선택-- </option>			
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
				<option value=""> --선택-- </option>
				<option value="01"> 1반 </option>			
				<option value="02"> 2반 </option>			
				<option value="03"> 3반 </option>			
			</select>
		</td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td> <input type="text" name="name" id="name" value="<%=rs.getString("name")%>"> </td>
	</tr>
	<tr>
		<td> 생년월일 </td>
		<td> 
			<!-- <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> -->
			<!-- <input type="text" name="birth" id="birth" onkeypress="inNumber(this)"> -->
			<select name="year" id="year">
				<option value=""> --선택-- </option>			
				<c:forEach var="i" begin="1900" end="2021">
				<option value="${i }"> ${i } </option>
				</c:forEach>
			</select>
			년
			<select name="month" id="month">
				<option value=""> --선택-- </option>			
				<c:forEach var="i" begin="1" end="12">
				<option value="${i }"> ${i } </option>
				</c:forEach>	
			</select>
			월
			<select name="day" id="day">
				<option value=""> --선택-- </option>
				<c:forEach var="i" begin="1" end="31">
				<option value="${i }"> ${i } </option>
				</c:forEach>
			</select>
			일
		</td>
	</tr>
	<tr>
		<td> 우편번호 </td>
		<td>
		    <input type="hidden" id="confmKey" name="confmKey" value=""  >
			<input type="text" id="zipNo" name="zipNo" readonly style="width:100px" value="<%=rs.getString("zipNo")%>">
			<input type="button"  value="주소검색" onclick="goPopup();">
		</td>
	</tr>
	<tr>
		<td>도로명주소</td>
		<td><input type="text" id="roadAddrPart1" name="juso" readonly style="width:85%" value="<%=rs.getString("juso")%>"></td>
	
	</tr>
	<tr>
		<td>상세주소</td>
		<td>
			<input type="text" id="addrDetail" name="juso_etc" readonly style="width:40%" value="<%=rs.getString("juso_etc")%>">
			<input type="text" id="roadAddrPart2"  style="width:40%" value="">
		</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" id="phone"value="<%=rs.getString("phone")%>" size="15"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="submit" value="입력">
			<input type="button" onclick="backToList()" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>
<!--
create table student(
id int auto_increment primary key,
name char(10),
hakbun char(10),
birth date,
zipNo char(5),
juso varchar(50),
juso_etc varchar(50),
phone char(15),
writeday date
);
-->