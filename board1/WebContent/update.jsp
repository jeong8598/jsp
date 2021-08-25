<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db = "jdbc:mysql://localhost:3306/pkc";
    String userid = "root";
    String pw = "1234";
    Connection conn = DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
    //request
    String id = request.getParameter("id");
    // 쿼리 생성
    String sql = "select * from member where id="+id;
    // 심부름꾼
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(my){
	if(my.name.value.length<3 || my.name.value.length>=5){
		alert("이름은 3자이상 5자 이하로 입력해주세요");
		return false;
	}else if(isNaN(my.age.value) || my.age.value.length==0){
		alert("나이는 숫자로 입력해주세요");
		return false;
	}else if(my.juso.value.length<2){
		alert("주소는 2글자 이상 입력해주세요");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<!-- 이름은 3자이상 5자이하, 나이는 숫자인가, 주소는 2자 이상 되면 전송하기 -->
<form name="pkc" method="post" action="update_ok.jsp" onsubmit="return check(this)">
	<input type="hidden" name="id" value="<%=id %>">
	이름 <input type="text" name="name" value="<%=rs.getString("name")%>"> <p>
	나이 <input type="text" name="age" value="<%=rs.getString("age")%>"> <p>
	주소 <input type="text" name="juso" value="<%=rs.getString("juso")%>"> <p>
	<input type="submit" value="수정">
</form>
</body>
</html>