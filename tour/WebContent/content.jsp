<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	//request값가져오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	int pager = request.getParameter("pager")==null ? 1 : Integer.parseInt(request.getParameter("pager"));
	//쿼리
	String sql = "select * from tour where id="+id;
	//심부름꾼
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
<style>
* {text-align:center;}
table{border-collapse:collapse;}
td {
	border:1px solid #dddddd;
	padding:10px;
}
tr:last-child td{
	text-align:right;
	border:none;
}
#imgBox{
	width:400px;
	height:auto;
	border:1px solid #dddddd;
	display:inline-block;
}
#imgBox img{
	max-width:100%;
	height:auto;
}
</style>
</head>
<body>
<table align="center" width="600">
	<colgroup>
		<col width="10%">
		<col width="90%">
	</colgroup>
	<tr>
		<td> 제목 </td>
		<td> <%=rs.getString("title") %> </td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td> <%=rs.getString("name") %> </td>
	</tr>
	<tr>
		<td colspan="2"><div id="imgBox"><img src="img/<%=rs.getString("fname") %>"> </div></td>
	</tr>
	<tr>
		<td colspan="2"> <%=rs.getString("content") %> </td>
	</tr>
	<tr>
		<td colspan="2"> 
			<input type="button" onclick="location.href='update.jsp?pager=<%=pager %>&id=<%=id%>'" value="수정">
			<input type="button" onclick="location.href='list.jsp?pager=<%=pager %>'" value="목록">
		</td>
	</tr>
</table>
</body>
</html>