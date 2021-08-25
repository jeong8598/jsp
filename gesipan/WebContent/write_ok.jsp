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
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String title=request.getParameter("title");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	String sung=request.getParameter("sung");
	/* select 
	String[] hobby=request.getParameterValues("hobby");	//checkbox는 여러개 값 선택가능 //request.getParameterValues("name값")=>선택된 value값 모두 가져옴 배열로 리턴
	String test=String.join(",",hobby);	//String클래스에 있는 join함수=> 배열을 구분문자를 가지고 문자열로 리턴해주는 함수 
	*/
	String hobby=String.join(",",request.getParameterValues("hobby"));
	String birth=request.getParameter("birth");
	//out.print(sung+" "+hobby+" "+birth);
	//쿼리생성
	String sql="insert into gesipan(name,title,pwd,content,sung,hobby,birth,writeday)";
	sql=sql+" values(?,?,?,?,?,?,?,now())";
	//심부름꾼생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,title);
	pstmt.setString(3,pwd);
	pstmt.setString(4,content);
	pstmt.setString(5,sung);
	pstmt.setString(6,hobby);
	pstmt.setString(7,birth);
	//쿼리실행
	pstmt.executeUpdate();
	//이동
	response.sendRedirect("list.jsp");
%>