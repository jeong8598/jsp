<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);

	//request
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String sung = request.getParameter("sung");
	String hobby = String.join(",",request.getParameterValues("hobby"));
	String birth = request.getParameter("birth");
	String pwd = request.getParameter("pwd");
	PreparedStatement pstmt =null;
	//비번가져오기
	String sql ="select pwd from gesipan where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//비번이 맞으면
	if(pwd.equals(rs.getString("pwd")))
	{
		//쿼리생성
		sql="update gesipan set title=?,name=?,content=?,sung=?,hobby=?,birth=? ";
    	sql=sql+" where id=?";
    	
		//심부름꾼 생성
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,name);
		pstmt.setString(3,content);
		pstmt.setString(4,sung);
		pstmt.setString(5,hobby);
		pstmt.setString(6,birth);
		pstmt.setString(7,id);
		
		//쿼리실행
		pstmt.executeUpdate();
		//이동
		response.sendRedirect("content.jsp?id="+id);
	}
	else //비번틀릴때
	{
		response.sendRedirect("update.jsp?id="+id+"&chk=1");
	}
%>