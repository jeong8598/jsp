<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>     
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
   
    // id값 가져오기
    String id=request.getParameter("id");
    
    // 쿼리생성
    String sql="select * from qna where id="+id; // order by는 나중에 처리할것임
    
    // 심부름꾼
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#msg{
	width:600px;
	color:red;
	visibility:hidden;
	}
	#check-pwd-box{
	position:absolute;
	visibility:hidden;
	}
	#pwd-box{
	width:600px;
	height:30px;
	margin:0 auto;
	}
</style>
<script>
$(function(){
	var sub = document.getElementById("sub")
	$('#deleteBtn').on('click',function(){
		document.checkPwd.style.visibility = "visible";
		document.checkPwd.action = "delete.jsp";
		sub.value = "삭제하기";
	});

	$('#updateBtn').on('click',function(){
		document.checkPwd.style.visibility = "visible";
		document.checkPwd.action = "update.jsp";
		sub.value = "수정하기";
	});

    $('#sub').on('click',function(){
		var frm = document.checkPwd;
		var input = frm.inputPwd.value;
		var id = frm.id.value;
		var pwd = frm.pwd.value;
		if(input==null){
			alert("비밀번호를 입력해주세요");
		}else{
			if(input!=pwd){
				document.getElementById("msg").style.visibility = "visible";
			}else{
				frm.submit();
			}
		}
	});
});
</script>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td>이름</td>
		<td><%=rs.getString("name") %></td>
		<td>작성일</td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<tr>
		<td> 제목 </td>
		<td colspan="3"> <%=rs.getString("title")%> </td>
	</tr>
	<tr>
		<td> 내용 </td>
		<td colspan="3"> <%=rs.getString("content")%> </td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" id="updateBtn" value="수정">
			<input type="button" id="deleteBtn" value="삭제">
			<a href="list.jsp"> 목록 </a> 
			<a href="rewrite.jsp?grp=<%=rs.getInt("grp")%>&seq=<%=rs.getInt("seq")%>&depth=<%=rs.getInt("depth")%>"> 답글쓰기 </a>
       </td>
	</tr>
</table>
<div id="pwd-box">
	<form name="checkPwd" action="" method="post" id="check-pwd-box">
		<input type="hidden" name="id" value="<%=id %>">
		<input type="hidden" name="pwd" value="<%=rs.getString("pwd") %>">
		비밀번호 : <input type="password" name="inputPwd" size="20" placeholder="비밀번호를 입력하세요.">
		<input type="button" id="sub" >
		<div id="msg">비밀번호가 일치하지 않습니다.</div>
	</form>
</div>
</body>
</html>
