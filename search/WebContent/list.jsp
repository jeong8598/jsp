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
	
    request.setCharacterEncoding("utf-8");		// 검색된 값을 인코딩하기 위해
	//limit에 들어갈 인덱스번호 생성
	int index;	//limit값에 전달할 index
	//int page;	 jsp 예약어 
	int pager;	//현재 나타내고자하는 페이지값을 저장
	if(request.getParameter("pager")==null)
	{
		pager=1;
	}
	else
	{
		pager=Integer.parseInt(request.getParameter("pager"));
	}
	//index만들기
	index=(pager-1)*10;
	//쿼리생성
	
	// 아무거나 => 검색조건이 없다..
    
    // 검색필드와 검색단어의 값을 request합니다..
    //String sql = null 은 존재하지 않는 것  String sql = ""; 은 값을 가지는 것
    String sql = "";
	String addsql="";
	String cla="";
	String sword="";
	if (request.getParameter("cla")==null)	
	{	//검색필드가 비어있으면 그냥 출력
		sql="select * from gesipan order by id desc limit "+index+",10";
	}
	
	else
	{
		cla = request.getParameter("cla");	//검색필드
		sword = request.getParameter("sword");	//검색단어
		if(cla.equals("name"))
		{
			//name필드를 검색
			sql="select * from gesipan where name like '%"+sword+"%' order by id desc limit "+index+",10";
			addsql="where name like '%"+sword+"%'";	
		}
		else
		{
			//title필드를 검색
			sql="select * from gesipan where title like '%"+sword+"%' order by id desc limit "+index+",10";
			addsql="where title like '%"+sword+"%'";
		}
	}
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs=stmt.executeQuery(sql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a
	{
	text-decoration:none;
	color:black;
	}
	a:hover
	{
	text-decoration:underline;
	}
</style>
<script>
	function init()
	{
		document.se.cla.value="<%=cla %>";
		
	}
</script>
</head>
<body onload="init()">
	<!-- 필드와 검색단어를 입력할 폼태그 -->
<div align="center">
	<form name="se" method="post" action="list.jsp">
		<select name="cla">
			<option value="name"> 이름 </option>
			<option value="title"> 제목 </option>
		</select>
		<input type="text" name="sword" value="<%=sword %>">
		<input type="submit" value="검색">
	</form>
</div>
<!-- 레코드내용출력 -->
<table width ="600" align="center">
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>성별</td>
		<td>작성일</td>
		
	</tr>
	<%
	while (rs.next())
	{	//숫자로 된 성별을 문자로 변환
		String sung=null;
		switch(rs.getInt("sung"))
		{
		case 0:sung="남자"; break;
		case 1:sung="여자"; break;
		case 2:sung="선택안함"; break;
		}
	%>
	<tr>
		<td> <%=rs.getString("name") %> </td>
		<!-- 페이지값 검색키워드값 검색단어값과 함께 보내줘야 다른 문서로 가도 다시돌아갈 수 있음 -->
		<td><a href="content.jsp?id= <%=rs.getInt("id") %>&pager=<%=pager %>&cla=<%=cla %>&sword=<%=sword %>"><%=rs.getString("title") %></a></td>
		<td><%=sung %></td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<%
	}
	%>
	<tr><!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<td colspan="2" align="center">
		<%
		//총 페이지 값 구하기 		총 레코드 수/페이지 당 레코드 수  select count(*) from gesipan
		sql="select count(*) as cnt from gesipan "+addsql;
		// 1. 없다 2. where name like '%검색어%' 3. where title like '%검색어%'
		ResultSet rs2=stmt.executeQuery(sql);
		rs2.next();
		int page_cnt=rs2.getInt("cnt")/10+1;
		//10의 배수일때 page_cnt-1
		if(rs2.getInt("cnt")%10==0)
			page_cnt--;
		//out.print(page_cnt);

		int pstart;
		pstart=pager/10;
		if (pager%10==0)
			pstart=pstart-1;
		
		pstart=Integer.parseInt(pstart+"1");	//문자"1"과 숫자를 더하고 숫자로 변환=>Integer.parseInt
				
		int pend=pstart+9;	// 251+9 => 260  총페이지 :254
		
		if(page_cnt<pend)
			pend=page_cnt;
		%>
		
		<!-- 이전페이지 -->
		<%
		if(pstart!=1){	//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)
		%>
		<!-- 이전페이지 -->
		<!-- 현재페이지 그룹 이전 10페이지 -->
		<a href="list.jsp?pager=<%=pstart-1 %>&cla=<%=cla %>&sword=<%=sword %>">◀◀</a>
		<%
		}
		else
		{
		%>
		◀◀
		<%
		}
		%>
		<!-- 현재페이지 기준 1페이지 이전 -->
		<%
		if(pager!=1){	//1페이지가 아닐때
		%>
		<a href="list.jsp?pager=<%=pager-1 %>&cla=<%=cla %>&sword=<%=sword %>">◀</a>
		<%
		}
		else 	//1페이지일 때는 링크 삭제
		{
		%>
		◀
		<%
		}
		%>
		<%
		for(int i=pstart;i<=pend;i++)
		{
			String str="";
			if(pager == i){
				str="style='color:red;'";
			}
		%>
		<a href="list.jsp?pager=<%=i %>&cla=<%=cla %>&sword=<%=sword %>" <%=str %>><%=i %></a>	
		<%
		}
		%>
		<%
		if(pager!=page_cnt){	//마지막 페이지가 아닐때
		%>
		<!-- 다음페이지 -->
		<a href="list.jsp?pager=<%=pager+1 %>&cla=<%=cla %>&sword=<%=sword %>">▶</a>
		<%
		}
		else 	//마지막 페이지일 때는 링크 삭제
		{
		%>
		▶
		<%
		}
		%>
		<!-- 현재페이지 그룹 다음 10페이지 -->
		<%
		if(pend!=page_cnt)
		{
		%>
		<a href="list.jsp?pager=<%=pend+1 %>">▶▶</a>
		<%
		}
		else
		{
		%>
		▶▶
		<%
		}
		%>
		</td>
	</tr>
	<tr>
		<td colspan="2"><a href="write.jsp">글쓰기</a></td>
	</tr>

</table>
</body>
</html>

<!-- select * from gesipan order by id desc limit 10; => 열개씩 출력 -->
<!-- select * from gesipan order by id desc limit 10,10; => 열개씩 출력 -->
<!-- select * from gesipan order by id desc limit 시작인덱스,가져올개수; => 열개씩 출력 -->