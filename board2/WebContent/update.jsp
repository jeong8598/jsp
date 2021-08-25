<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pwd);
	//request 값 가져오기
	String id = request.getParameter("id");
	//쿼리생성
	String sql = "select * from board where id="+id;
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	//쿼리실행
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="board1.css">
<script type="text/javascript" src="update.js"></script>
</head>
<body>
<form name="frm" method="post" action="update_ok.jsp" onsubmit="return check(this)">
	<input type="hidden" name="id" value="<%=id %>">
	<table width="600" align="center">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr>
			<td> 제 목 </td>
			<td> <input type="text" name="title" value="<%=rs.getString("title")%>"> </td>
		</tr>
		<tr>
			<td> 작성자 </td>
			<td> <input type="text" name="name" value="<%=rs.getString("name")%>"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="50" rows="4" name="content"> <%=rs.getString("content") %> </textarea></td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd"> 
		<%
			if(request.getParameter("chk") != null){
		%>
				<span style="color:red;"> 비밀번호가 일치하지 않습니다. </span>
		<%
			}
		%>
		</tr>
		<tr>
			<td colspan="2"><button id="btn"> 수정하기 </button></td>
		</tr>
	</table>
</form>
</body>
</html>