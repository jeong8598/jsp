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
	//request값
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//쿼리생성
	String sql = "select count(*) cnt from board where id="+id+" and pwd='"+pwd+"'";
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	if(rs.getInt("cnt")>0){
		sql = "delete from board where id="+id;
		stmt.executeUpdate(sql);
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
%>