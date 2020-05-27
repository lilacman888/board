<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowpage = request.getParameter("page");
			
	BoardDBBean dao = BoardDBBean.getInstance();
	
	// 조회수 증가 + 상세 정보 구하기
	BoardDataBean board = dao.updateContent(num);
	
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	String content = board.getContent().replace("\n", "<br>");
	
%>    

<table border=1 width=500 align=center>
	<caption>상세 페이지</caption>
	<tr><td width=100>번호</td>
		<td><%=board.getNum() %></td>
		<td>조회수</td>
		<td><%=board.getReadcount() %></td>
	</tr>
	<tr><td width=100>작성자</td>
		<td><%=board.getWriter() %></td>
		<td>작성일</td>
		<td><%=sd.format(board.getReg_date()) %></td>
	</tr>
	<tr><td width=100>제목</td>
		<td colspan=3><%=board.getSubject() %></td>
	</tr>
	<tr><td width=100>내용</td>
		<td colspan=3 width=400>
		<%=content%>
		<%-- <pre><%=board.getContent() %></pre> --%>
		</td>
	</tr>
	<tr><td colspan=4 align=center width=500>
			<input type="button" value="글수정" 
onClick="location.href='updateform.jsp?num=<%=num%>&page=<%=nowpage%>' ">
			
			<input type="button" value="글삭제" 
onClick="location.href='deleteform.jsp?num=<%=num%>&page=<%=nowpage%>' ">
			
			<input type="button" value="글목록" 
				onClick="location.href='list.jsp?page=<%=nowpage%>'  ">
			
		</td>
	</tr>

</table>








