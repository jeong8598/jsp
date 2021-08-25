<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);	//db정보,아이디,비번
	
	//request값
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int sci = Integer.parseInt(request.getParameter("sci"));
	//쿼리생성
	
	String sql = "update score set name='"+name+"', kor="+kor+", eng="+eng+", math="+math+", sci="+sci+" where id="+id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	stmt.executeUpdate(sql);
	//이동
	response.sendRedirect("sung_view.jsp");

%>