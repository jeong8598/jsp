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
	//페이징,검색어연습 위한 임의로 값 넣어주기
	request.setCharacterEncoding("utf-8");
	String name="나그네";
	String title="페이지 연습하려고합니다.";
	String pwd="1234";
	String content="학교종이 땡땡땡";
	String sung="1";
	String hobby="0,1,4";
	String birth="1996";
	//out.print(sung+" "+hobby+" "+birth);
	//쿼리생성
	for(int i=1;i<=2537;i++)
	{
	String sql="insert into gesipan(name,title,pwd,content,sung,hobby,birth,writeday)";
	sql=sql+" values(?,?,?,?,?,?,?,now())";
	//심부름꾼생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name+i);
	pstmt.setString(2,title+" "+i);
	pstmt.setString(3,pwd);
	pstmt.setString(4,content);
	pstmt.setString(5,sung);
	pstmt.setString(6,hobby);
	pstmt.setString(7,birth);
	//쿼리실행
	pstmt.executeUpdate();
	}
	//이동
	response.sendRedirect("list.jsp");
	
%>