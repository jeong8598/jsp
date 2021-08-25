<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	int index;	//limit값에 전달할 시작 인덱스
	//page 번호
	int pager = request.getParameter("pager")==null ? 1 : Integer.parseInt(request.getParameter("pager"));
	/* 
	select * from gesipan order by id desc limit 10; => 열개씩 출력
	select * from gesipan order by id desc limit 10,10; => 열개씩 출력
	select * from gesipan order by id desc limit 시작인덱스,가져올개수; => 열개씩 출력
	*/
	//index만들기
	index = (pager-1)*5;
	//쿼리생성
	String sql = "select tt.* from (select @rownum:=@rownum+1 as rnum, t.* from tour t,(select @rownum:=0) tmp order by id desc)tt limit "+index+",5";
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	//실행
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	text-decoration:none;
	color:black;
}
td {text-align:center;}
tr:first-child td{
	text-align:right;
}
</style>
</head>
<body>
<table align="center" width="600">
	<tr>
		<td colspan="4"><a href="write.jsp">글쓰기</a></td>
	</tr>
	<tr>
		<td> 제목 </td>
		<td> 이름 </td>
		<td> 사진 </td>
		<td> 작성일 </td>
	</tr>
	<%
		while (rs.next()){
	%>
	<tr>
		<td><a href="content.jsp?id=<%=rs.getString("id") %>&pager=<%=pager%>"> <%=rs.getString("title") %> </a></td>
		<td><a href="content.jsp?id=<%=rs.getString("id") %>&pager=<%=pager%>"> <%=rs.getString("name") %> </a></td>
		<td><a href="content.jsp?id=<%=rs.getString("id") %>&pager=<%=pager%>"> <img src="img/<%=rs.getString("fname")%>" width="200" height="200"> </a></td>
		<td> <%=rs.getString("writeday") %> </td>
	</tr>
	<%
		}
	%>
	<tr>
		<td colspan="4">
		<%
			//총페이지 값 구하기
			//총 레코드수/페이지당 레코드수 select count(*) from gesipan
			sql = "select count(*) cnt from tour";
			rs = stmt.executeQuery(sql);
			rs.next();
			int pageCnt = (rs.getInt("cnt")/5)+1;
			//5의 배수일때 page_cnt-1
			if(rs.getInt("cnt")%5==0)
				pageCnt--;
			int pstart ;
			pstart = pager/5;	//페이지 시작번호
			if(pager%5 == 0)
				pstart = pstart-1;
			pstart = Integer.parseInt(pstart+"1");
			//문자"1"과 숫자를 더하고 숫자로 변환=>Integer.parseInt
			
			int pend = pstart+4;	//페이지 끝번호
			
			if(pageCnt < pend)
				pend = pageCnt;
		%>
		<!-- 이전 페이지 -->
		<%
			if(pstart!=1){
		%>
		<!-- 현재페이지 그룹(5페이지) 이전 페이지 -->
		<a href="list.jsp?pager=<%=pstart-1 %>"> ◀◀ </a>
		<%
			}else{
		%>
		◀◀
		<%
			}
		%>
		<!-- 현재페이지 기준 1페이지 이전 -->
		<%
			if(pager!=1){
		%>
		<a href="list.jsp?pager=<%=pager-1 %>"> ◀ </a>
		<%
			}else{
		%>
		◀
		<%
			}
		%>
		<%
			for(int i=pstart ; i<=pend ; i++){
				String str = "";
				if(pager == i)
					str="style='color:red;'";
		%>
		<a href="list.jsp?pager=<%=i %>" <%=str %>><%=i %></a>
		<%
			}
		%>
		<%
			if(pager!=pageCnt){	//마지막 페이지가 아닐때
		%>
		<!-- 다음페이지 -->
		<a href="list.jsp?pager=<%=pager+1 %>">▶</a>
		<%
			}else{ 	//마지막 페이지일 때는 링크 삭제
		%>
		▶
		<%
			}
		%>
		<!-- 현재페이지 그룹 다음 10페이지 -->
		<%
			if(pend!=pageCnt){
		%>
		<a href="list.jsp?pager=<%=pend+1 %>">▶▶</a>
		<%
			}else{
		%>
		▶▶
		<%
			}
		%>
		</td>
	</tr>
</table>
</body>
</html>
