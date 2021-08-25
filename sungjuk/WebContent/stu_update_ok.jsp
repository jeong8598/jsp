<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* " %>
<%
//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	//request값 가져오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month").length()==1 ? "0"+request.getParameter("month") : request.getParameter("month");
	String day = request.getParameter("day").length()==1 ? "0"+request.getParameter("day") : request.getParameter("day");
	String birth = year+"-"+month+"-"+day;
	System.out.print(year+month+day);
	String zipNo = request.getParameter("zipNo");
	String juso = request.getParameter("juso");
	String juso_etc = request.getParameter("juso_etc");
	String phone = request.getParameter("phone");
	String grade = request.getParameter("grade");
	String ban = request.getParameter("ban");
	String hakbun = "s"+grade+ban;	//학번앞 5자리 s는 그냥 부여 => 's0301'
	
	//뒤에 붙여줄 두자리 만들기
	String sql2 = "select ifnull(max(substring(hakbun,6,2)),0) as bun from student where hakbun like '"+hakbun+"%'";
	//hakbun like 's0301'
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql2);
	rs.next();
	Integer bun = rs.getInt("bun");
	bun++;	
	//숫자타입에 length()를 할 수없으므로 toString()하여 구하기
	if(bun.toString().length() == 1)
		hakbun+="0"+bun;	//값은 1~99 => 한자리일 경우 0을 붙여야함
	else
		hakbun+=bun;
	
	//쿼리생성
	String sql = "update student set name=?, hakbun=?, birth=?, zipNo=?, juso=?, juso_etc=?, ";
	sql=sql+"phone=?, writeday=now() where id="+id;
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, hakbun);
	pstmt.setString(3, birth);
	pstmt.setString(4, zipNo);
	pstmt.setString(5, juso);
	pstmt.setString(6, juso_etc);
	pstmt.setString(7, phone);
	//쿼리실행
	pstmt.executeUpdate();
	//이동
	response.sendRedirect("stu_list.jsp");
%>