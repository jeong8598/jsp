<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>x
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
<style>
a{
color:black;
text-decoration:none;
}
a:hover{color:orange;}
table{border-collapse: collapse}
td {
text-align:center;
width:100px;
border:1px solid orange;
padding:10px 0;
}
tr:last-child td{
border:none;
text-align:right;
}
#delFrm {
position:absolute;
visibility:hidden;
}
#msg{
border:none;
color:red;
}
</style>
<script>
function view_del(){
	var x = event.clientX;
	var y = event.clientY;
	document.getElementById("delFrm").style.visibility = "visible";
	document.getElementById("delFrm").style.left = (x-50)+"px";
	document.getElementById("delFrm").style.right = (y-50)+"px";
}
</script>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td> 제목 </td>
		<td colspan="5"> <%=rs.getString("title")%></td>
	</tr>
	<tr>
		<td> 작성자 </td>
		<td> <%=rs.getString("name")%> </td>
		<td> 조회수 </td>
		<td> <%=rs.getString("readnum")%> </td>
		<td> 작성일 </td>
		<td> <%=rs.getString("writeday")%> </td>
	</tr>
	<tr>
		<td colspan="6" height="200"> <%=rs.getString("content") %> </td>
	</tr>
	<%
		if(request.getParameter("chk") != null){
	%>
	<tr>
		<td colspan="6" id="msg"> 비밀번호가 일치하지 않습니다. </td>
	</tr>
	<%
		}
	%>
	<tr>
		<td colspan="6">
			<a href="update.jsp?id=<%=id %>"> 수정 </a>
			<a href="#" onclick="view_del()"> 삭제 </a>
			<a href="list.jsp"> 목록 </a>
		</td>
	</tr>
</table>
<form method="post" action="delete.jsp" id="delFrm">
	<input type="hidden" name="id" value="<%=id %>">
	비밀번호 : <input type="password" name="pwd" size="4">
	<input type="submit" value="삭제">
</form>
</body>
</html>