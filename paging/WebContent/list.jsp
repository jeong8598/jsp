<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="paging.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="paging.DB_Conn"%>
<%
	DB_Conn db = new DB_Conn();
	//전체 레코드 수
	int pager = 0;
	if(request.getParameter("pager")==null){
		pager=1;
	}else{
		pager=Integer.parseInt(request.getParameter("pager"));
	}
	
	ArrayList<BoardDTO> list = db.list(pager);	//페이지에 해당하는 리스트 가져오기
	//한 페이지에 10개 글 출력
	//총 레코드 수
	int allContent = db.all_record();
	int pageCnt = allContent/10;	//1~9까지의 레코드는 포함되지 않음
	if(allContent%10!=0){
		pageCnt = pageCnt+1;
	}
	//첫페이지,마지막 페이지 구하기
	int pstart = pager/10;
	if(pager%10 == 0){
		if(pstart>1){
			pstart = (pstart-1)*10+1;
		}else{
			pstart = 1;
		}
	}else{
		pstart = pstart*10+1;
	}
	
	int pend = pstart+9;
	if(pend > pageCnt)
		pend=pageCnt;
	
	//맨 마지막 글 삭제 시 전 페이지로 가기위해  
	int lastChk = 0;
	if(allContent%10==1 && pager==pageCnt){
		lastChk = 1;
	}
	pageContext.setAttribute("pageCnt", pageCnt);
	pageContext.setAttribute("lastChk", lastChk);
	pageContext.setAttribute("pstart", pstart);
	pageContext.setAttribute("pend", pend);
	pageContext.setAttribute("pager", pager);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{text-align:center;}
table{border-collapse: collapse;}
tr:first-child td{border-top:none;}
tr:last-child td{border-top:none;}
td{
border-top: 1px solid #444444;
padding:10px;
}
a{
text-decoration: none;
color:black;
}
#writeBtn{
text-align:right;
}
</style>
</head>
<body>
<table width="600" align="center">
	<colgroup>
		<col style="width:45%">
		<col style="width:20%">
		<col style="width:15%">
		<col style="width:20%">
	</colgroup>
	<tr>
		<td id="writeBtn" colspan="4"><a href="write.jsp?pager=${pager }">글쓰기</a></td>
	</tr>
	<tr>
		<td> 제목 </td>
		<td> 이름 </td>
		<td> 조회수 </td>
		<td> 작성일 </td>
	</tr>
	<c:forEach items="${list }" var="bdto">
	<tr>
		<td><a href="content.jsp?id=${bdto.id }&pager=${pager}&lastChk=${lastChk}"> ${bdto.title } </a></td>
		<td><a href="content.jsp?id=${bdto.id }&pager=${pager}&lastChk=${lastChk}"> ${bdto.name } </a></td>
		<td> ${bdto.readnum } </td>
		<td> ${bdto.writeday } </td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center">
		<!-- 이전페이지 이동(1페이지, 이전 그룹페이지) -->
		<!-- 이전페이지 이동 시작 -->
		<c:if test="${pstart != 1 }">
			<a href="list.jsp?pager=${pstart-1 }"> ◀◀  </a>
		</c:if>
		<c:if test="${pstart == 1 }"> ◀◀ </c:if>
		<c:if test="${pager != 1 }"> 
			<a href="list.jsp?pager=${pager-1 }"> ◀  </a>
		</c:if>
		<c:if test="${pager == 1 }"> ◀ </c:if>
		<!-- 이전 1페이지 이동 끝 -->
		<!-- pstart부터 pend까지 출력 -->
		<c:forEach var="i" begin="${pstart }" end="${pend }">
			<c:if test="${pager != i }">
				<a href="list.jsp?pager=${i }">${i }</a>
			</c:if>
			<c:if test="${pager == i}">
				<a href="list.jsp?pager=${i}" style="color:red"> ${i} </a>
			</c:if>
		</c:forEach>
		<!-- 다음페이지 이동( 1페이지, 다음그룹페이지)  -->   
		<!-- 1페이지 다음 이동 시작 -->
		<c:if test="${pager != pageCnt }"> 
			<a href="list.jsp?pager=${pager+1 }"> ▶  </a>
		</c:if>
		<c:if test="${pager == pageCnt}"> ▶ </c:if>
		<!-- 1페이지 다음 이동 끝 -->
		<!-- 다음 그룹 페이지 이동 시작 -->
		<c:if test="${pend != pager }">
			<a href="list.jsp?pager=${pend+1 }"> ▶▶ </a>
		</c:if>
		<c:if test="${pend == pager }"> ▶▶ </c:if>
		<!-- 다음 그룹 페이지 이동 끝 -->
		</td>
	</tr>
	<%
	db.conn_close(); // connection  종료
	%>
	<tr>
		<td id="writeBtn" colspan="4"><a href="write.jsp?pager=${pager }">글쓰기</a></td>
	</tr>
</table>
</body>
</html>