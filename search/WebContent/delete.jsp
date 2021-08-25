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
	
	//request값
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pager=request.getParameter("pager");
    String cla=request.getParameter("cla");
    String sword=request.getParameter("sword");
	
	//db비밀번호 값
	String sql = "select pwd from gesipan where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	if(pwd.equals(rs.getString("pwd")))
	{
	//쿼리생성
	sql = "delete from gesipan where id="+id;
	//심부름꾼 생성
	stmt = conn.createStatement();
	//쿼리실행
	stmt.executeUpdate(sql);
	//이동
	response.sendRedirect("list.jsp?pager="+pager+"&cla="+cla+"&sword="+sword);
	}
	else
	{
		response.sendRedirect("content.jsp?id="+id+"&chk=1&pager="+pager+"&cla="+cla+"&sword="+sword);
	}
	
	stmt.close();
	conn.close();
%>

