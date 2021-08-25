<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	//String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,"root",pw);
	//request값
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	//쿼리생성
	String sql = "select * from member2 where userid='"+userid+"' and pwd='"+pwd+"'";
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	//실행결과(1.레코드가 비었거나 2.레코드가 존재하거나)
	if(rs.next()){	//아이디, 비번 동일한 항목있을 때
		//세션변수를 부여(우리 웹페이지에 있는 회원만 볼수 있는 문서를 볼수 있도록)
		session.setAttribute("userid", rs.getString("userid"));
		//application 변수에 방금 로그인한 사용자 아이디를 추가(누적)
		//toString은 Object라는 최상위클래스에 상속받기 때문에 어디서든 사용가능
		String imsi = null;
		if(application.getAttribute("name")!=null){
			imsi = application.getAttribute("name").toString();
			imsi += ":" + rs.getString("userid");
		}else{
			imsi = rs.getString("userid");
		}
		application.setAttribute("name", imsi);
		//메인페이지로 이동(index.jsp)
		response.sendRedirect("index.jsp");
	}else{	//아이디, 비번이 틀릴 때
		//다시 로그인하도록 login.jsp로 이동
		response.sendRedirect("login.jsp?chk=1");
	}
%>