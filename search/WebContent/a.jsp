<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

    //정렬순서 cla 변수 값이 안들어오는 경우 cla=kor
    String ord="";
    if(request.getParameter("cla")==null) 
    	ord="name";
    else
    	ord=request.getParameter("cla");
    //쿼리생성
    String sql="select id,name,kor,eng,math,sci,writeday, kor+eng+math+sci sum ,(kor+eng+math+sci)/4 avg from score order by "+ord+" asc";
    
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
input[type="text"] {
	width: 50px;
}
td {
	width: 100px;
}
#update{
	visibility: hidden;
}
</style>
</head>
<script>
	function view(id)
	{
		window.open("sung.jsp?id="+id,"","width=500, height=300")
	}
	
	function check()
	{
		if(document.input.name.value=='')
		{
			alert('이름을 입력하세요');
			return false;
		}
		
		var arr = new Array();
		
		arr[0] = validNumber(document.input.kor.value);
		arr[1] = validNumber(document.input.eng.value);
		arr[2] = validNumber(document.input.math.value);
		arr[3] = validNumber(document.input.sci.value);

		for(var i=0;i<arr.length;i++)
		{
			if(arr[i]==false)
			{
				return false;
			}
		}
		
		return true;
	}
	
	function validNumber(e)
	{
		//isNaN() 문자=>true, 숫자=>false, 빈칸=>false
		
		
		for(var i=0;i<e.length;i++)
		{
			
			if(e.charAt(i).charCodeAt(i)<48||e.charAt(i).charCodeAt(i)>58)
			{
				alert("성적은 숫자만 입력하세요");
				return false;
			}	
		}
		
		if(!(parseInt(e)>=0&&parseInt(e)<=100))
		{
			alert("성적은 0~100사이 숫자만 입력하세요");
			return false;
		}
		
		return true;
	}

	function update(id, kor, eng, math, sci, name)
	{
		document.update.style.visibility="visible";
		
		document.getElementById("name").innerHTML=name;
		
		document.update.id.value=id;
		document.update.kor.value=kor;
		document.update.eng.value=eng;
		document.update.math.value=mat;
		document.update.sci.value=sci;
		
		
	}
	
</script>

<body>

<h1>성적 입력</h1>
<form name="input" action="input_ok.jsp" onsubmit="return check()">
이름 <input type="text" name="name">
국어 <input type="text" name="kor">
영어 <input type="text" name="eng">
수학 <input type="text" name="math">
과학 <input type="text" name="sci">
<input type="submit" value="성적 입력"><input type="reset" value="다시 작성">
</form>
<h1>성적표</h1>
<table>
	<tr>
		<th>이름</th>
		<th><a href="sung_view.jsp?cla=kor">국어</a></th>
		<th><a href="sung_view.jsp?cla=eng">영어</a></th>
		<th><a href="sung_view.jsp?cla=math">수학</a></th>
		<th><a href="sung_view.jsp?cla=sci">과학</a></th>
		<th><a href="sung_view.jsp?cla=sum">총점</a></th>
		<th><a href="sung_view.jsp?cla=avg">평균</a></th>
		<th>수정</th>
	</tr>
	<%
	while(rs.next())
	{
		int kor = rs.getInt("kor");
		int eng = rs.getInt("eng");
		int math = rs.getInt("math");
		int sci = rs.getInt("sci");
		
		int sum = kor+eng+math+sci;
		double avg = (double)sum/4;
		
	%>
	<tr>
		<td><a href="javascript:view(<%=rs.getInt("id")%>)"><%=rs.getString("name") %></a></td>
		<td><%=kor %></td>
		<td><%=eng %></td>
		<td><%=math %></td>
		<td><%=sci %></td>
		<td><%=sum %></td>
		<td><%=avg %></td>
		<td><a href="javascript:update(<%=rs.getString("id")%>, <%=kor%>, <%=eng%>, <%=math%>, <%=sci%>, '<%=rs.getString("name")%>')">수정</a></td>
	</tr>
	<%
	}
	%>
	<tr>

	
	<td colspan="8">
	<form name="update" id="update" action="update_ok.jsp">
		<span id="name"></span>
		<input type="hidden" name="id" value="">
		국어<input type="text" name="kor" size="6"> 영어<input type="text" name="eng" size="6">
		수학<input type="text" name="mat" size="6"> 과학<input type="text" name="sci" size="6">
		<input type="submit" value="수정하기">
	</form>
	</td>
	</tr>
</table>
</body>
</html>