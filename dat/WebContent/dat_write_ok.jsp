<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//request값 읽어오기
	request.setCharacterEncoding("utf-8");
    String gid=request.getParameter("gid");
    String name=request.getParameter("name");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");

	//쿼리생성
	String sql="insert into dat(name,content,pwd,writeday,gid)";
	sql=sql+" values (?,?,?,now(),?)";
			
	//심부룸꾼생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,content);
	pstmt.setString(3,pwd);
	pstmt.setString(4,gid);

	//쿼리실행
	pstmt.executeUpdate();
	
	//실행 후 이동
	response.sendRedirect("content.jsp?id="+gid);
%>