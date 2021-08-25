<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	//쿼리생성
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
	border:none;
}
input[type=text]{
	width:80%;
	height:20px;
}
</style>
</head>
<body>
<!-- 파일업로드 시 자주사용하는 데이터전송타입 enctype="multipart/form-data"-->
<form name="fileFrm" action="update_ok.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%=id %>">
	<input type="hidden" name="id" value="<%=pager %>">
	<table align="center" width="600">
		<colgroup>
			<col width="10%">
			<col width="90%">
		</colgroup>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title" value="<%=rs.getString("title")%>"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" value="<%=rs.getString("name")%>"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td><textarea cols="60" rows="10" name="content"> <%=rs.getString("content")%> </textarea></td>
		</tr>
		<tr>
			<td> 파일 </td>
			<td><input type="file" name="fname" class="fname">
			</td>
		</tr>
		<tr>
			<td colspan="2"> 
				<input type="submit" value="올리기">
				<input type="button" onclick="location.href='list.jsp?pager=<%=pager %>'" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>