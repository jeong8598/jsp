<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
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
    String sql="select id,name,kor,eng,math,sci,writeday,kor+eng+math+sci total ,(kor+eng+math+sci)/4 avg from score order by "+ord+" asc";
    
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
<script>
	//창띄워서 수정할때
/* 	function view(id){
		 window.open("sung.jsp?id="+id,"","width=400,height=200");
	} */
	/* 
	이름의 입력여부 길이,비어있는지
	document.폼.name.value.length==0
	document.폼.name.value.length==""
	*/
	/* 
	국,영,수,과
	1. 입력되었는지?
	2. 숫자인지 isNaN() : 문자=>true 숫자=>false
	document.폼.name.value.length==0
	document.폼.name.value.length==""
	*/
	function check(my){
		if(my.name.value.length==0){ // form.name.value.length==""
			alert("이름을 입력하세요");
			return false;
		}
		if(!ischeck(my.kor.value.trim())){	/* trim()=>스페이스 빈문자를 없애주는 역할 */
			alert("국어점수를 1~100사이의 숫자로 입력하세요");
			return false;
		}
		if(!ischeck(my.eng.value.trim())){
			alert("영어점수를 1~100사이의 숫자로 입력하세요");
			return false;
		}
		if(!ischeck(my.math.value.trim())){
			alert("수학점수를 1~100사이의 숫자로 입력하세요");
			return false;
		} 
		if(!ischeck(my.sci.value.trim())){
			alert("과학점수를 1~100사이의 숫자로 입력하세요");
			return false;
		}
		return true;
	}
	function ischeck(jumsu){
		if(jumsu<0 || jumsu>100 || isNaN(jumsu) || jumsu.length==0){
			return false;
		}
		return true;
	}

    function update(id,n,k,e,m,s){
		//성적입력 => 성적수정으로 변경
		document.frm.action="update_ok.jsp";
		document.getElementById("submit").value="수정";
	 	document.getElementById("s").innerHTML="성적수정";
		document.frm.id.value=id;
		document.frm.name.value=n;
		document.frm.kor.value=k;
		document.frm.eng.value=e;
		document.frm.math.value=m;
		document.frm.sci.value=s;
		//document.pkc.name.disabled=true; 이름 수정 못하게 함!
     }
    function cancel(){
    	//성적수정 => 성적입력으로 변경
		document.frm.action="input_ok.jsp";
		document.getElementById("submit").value="입력";
		document.getElementById("s").innerHTML="성적입력";	
    }
	function stu_list(){
		location="stu_list.jsp";
	}
</script>
<style>
	a {
	text-decoration:none;
	color:black;
	}
	td{
	text-align: center;
	border:1px solid #cccccc;
	}
	#update {
	font-weight:900;
	color:MediumSeaGreen;
	}
	#s {
	font-weight:900;
	}
</style>
</head>
<body>
<table align="center" width="800">
	<tr>
		<td colspan="9">
		<form name="frm" method="post" action="input_ok.jsp" onsubmit="return check(this);">
		    <input type="hidden" name="id">
		    <span id="s">성적입력</span><p>
			이름<input type="text" name="name" size="5" id="name">
			국어<input type="text" name="kor" size="5" id="kor">
			영어<input type="text" name="eng" size="5" id="eng">
			수학<input type="text" name="math" size="5" id="math">
			과학<input type="text" name="sci" size="5" id="sci">
			<input type="submit" value="입력" id="submit">
			<input type="reset" value="취소" onclick="cancel()">
		</form>
		</td>
			<tr>
		<td><a href="sung_view.jsp?cla=name"> 이름 </a></td>
		<td><a href="sung_view.jsp?cla=kor"> 국어 </a></td>
		<td><a href="sung_view.jsp?cla=eng"> 영어 </a></td>
		<td><a href="sung_view.jsp?cla=math"> 수학 </a></td>
		<td><a href="sung_view.jsp?cla=sci"> 과학 </a></td>
		<td><a href="sung_view.jsp?cla=total"> 합계 </a></td>
		<td><a href="sung_view.jsp?cla=avg"> 평균 </a></td>
		<td>수정</td>
     </tr>
    <% 
		while(rs.next()){ 
			int kor = rs.getInt("kor");
			int eng = rs.getInt("eng");
			int math = rs.getInt("math");
			int sci = rs.getInt("sci");
			int total = rs.getInt("total");
			double avg = (double)total/4;
	%>
	<tr id="tr<%=rs.getInt("id")%>">
		<td> <a href="javascript:view(<%=rs.getInt("id")%>)"> <%=rs.getString("name")%> </a> </td>
		<td> <%=kor %> </td>
		<td> <%=eng %> </td>
		<td> <%=math %> </td>
		<td> <%=sci %> </td>
		<td> <%=total %> </td>
		<td> <%=avg %> </td>
		<td><a href="javascript:update(<%=rs.getInt("id")%>,'<%=rs.getString("name") %>',<%=rs.getInt("kor")%>,<%=rs.getInt("eng")%>,<%=rs.getInt("math")%>,<%=rs.getInt("sci")%>)" id="update">수정</a>
		</td>
     </tr>
    <%
	} 
	%>
	<tr>
		<td colspan="9" align="center">
			<input type="button" value="학생관리" onclick="stu_list()">
		</td>
	</tr>
</table>
</body>
</html>