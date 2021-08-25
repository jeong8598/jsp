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
	//쿼리생성
	String sql = "select * from student order by id desc";
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr{
text-align:center;
}
td{
text-align: center;
border:1px solid #cccccc;
}
</style>
<script>
	function stu_input(){
		location="stu_input.jsp";
	}
	function sung_view(){
		location="sung_view.jsp";
	}
</script>
</head>
<body>
<table width="800" align="center">
	<tr>
		<td>학번</td>
		<td>이름</td>
		<td>생일</td>
		<td>전화번호</td>
	</tr>
	<%
		while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("hakbun") %></td>
		<td><a href="stu_update.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("name") %></a></td>
		<td><%=rs.getString("birth") %></td>
		<td><%=rs.getString("phone") %></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td colspan="4" align="center">
			<input type="button" value="학생명단추가" onclick="stu_input()"> 
      		<input type="button" value="성적입력/목록" onclick="sung_view()"> 
		</td>
	</tr>
</table>
</body>
</html>