<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request값
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "select * from board2 where id="+id;
	
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
<script>
	function init()
	{
		//성별
		document.board.sung[<%=rs.getInt("sung")%>].checked=true
	}
	function list()
	{
			location="list.jsp";
	}
</script>
</head>
<body  onload="init()">
<form name="board" method="post" action="update_ok.jsp">
	<input type="hidden" name="id" value="<%=id %>">
	<table align="center" width="800">
		<tr>
			<td>제목</td>
			<td size="50"><input type="text" name="title"  size="50" value="<%=rs.getString("title") %>"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" value="<%=rs.getString("birth") %>"></td>
		</tr>
		<tr>
			<td>성별</td>
		    <td> 
				<input type="radio" name="sung" value="0">남자 
		       	<input type="radio" name="sung" value="1">여자
		    </td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="60" rows="4" name="content" id="content"> <%=rs.getString("content") %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기"> 
				<button type="button" onclick="list()">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>