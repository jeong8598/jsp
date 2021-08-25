<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	
	//id값 가져오기
	String id = request.getParameter("id");
	//쿼리생성
	String sql = "select * from qna where id="+id;
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
input[type=text]{
width:400px;
}
#pwdBox{
display:none;
}
#unchgPwd{
display:none;
}
</style>
<script type="text/javascript" src="update.js"></script>
</head>
<body>
<form name="frm" method="post" action="update_ok.jsp" onsubmit="return chkData();">
	<input type="hidden" name="id" value="<%=rs.getString("id")%>">
	<table align="center" width="600">
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title" value="<%=rs.getString("title")%>"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" value="<%=rs.getString("name")%>" onkeydown="chkSpacebar();"> </td>
		</tr>
		<tr>
			 <td> 내용 </td>
			 <td> <textarea cols="60" rows="4" name="content"><%=rs.getString("content") %></textarea> </td>
		</tr>
		<tr>
			<td> <input type="submit" value="질문수정"> </td>
			<td> <a href="content.jsp?id=<%=rs.getString("id")%>">취소</a></td>
		</tr>
	</table>
</form>
</body>
</html>
