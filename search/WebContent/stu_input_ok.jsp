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
	
	//request
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String zip = request.getParameter("zip");
	String juso = request.getParameter("juso");
	String juso_etc = request.getParameter("juso_etc");
	String phone = request.getParameter("phone");
	String year = request.getParameter("year");
	String ban = request.getParameter("ban");
	String hakbun = "s"+year+ban;	//학번 앞 5자리 s문자는 그냥 부여 => 's0301'
	//뒤에 붙여줄 두자리 만들어야함
	String sql2 ="select ifnull(max(substring(hakbun,6,2)),0) as bun from student where hakbun like '"+hakbun+"%'";// hakbun like 's0301'
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql2);
	rs.next();
	Integer bun = rs.getInt("bun");
	bun++; // 값은  1~99 => 한자리일경우  0을 붙여야 된다..
	if(bun.toString().length() == 1)	//값은 1~99 => 한자리일 경우 앞에 0을 붙여야한다.	//숫자타입에 length()를 할 수없으므로 toString()하여 구하기
		hakbun=hakbun+"0"+bun;
	else
		hakbun=hakbun+bun;
	
	//쿼리생성
	String sql = "insert into student (name,hakbun,birth,zip,juso,juso_etc,phone,writeday) ";
	sql = sql+" values (?,?,?,?,?,?,?,now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,hakbun);
	pstmt.setString(3,birth);
	pstmt.setString(4,zip);
	pstmt.setString(5,juso);
	pstmt.setString(6,juso_etc);
	pstmt.setString(7,phone);
	
	//쿼리실행
	pstmt.executeUpdate();
	
	//이동
	response.sendRedirect("stu_list.jsp");
%>