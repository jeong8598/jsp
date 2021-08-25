<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	
	//request값 가져오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id").trim();
	String name = request.getParameter("name").trim();
	String content = request.getParameter("content").trim();
	String title = request.getParameter("title").trim();
	
	//쿼리생성
	String sql = "update qna set name=?,title=?,content=? where id=?";
	
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,title);
	pstmt.setString(3,content);
	pstmt.setString(4,id);
	
	//실행
	pstmt.executeUpdate();
	
	//이동
	response.sendRedirect("content.jsp?id="+id);
%>