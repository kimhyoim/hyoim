<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.gustDAO"/>
<jsp:useBean id="dto" class="gust.gustDTO"/>
<%
	request.setCharacterEncoding("utf-8");

// 	String id = (String) session.getAttribute("id");
	String id = (String) request.getParameter("id");
	String content = request.getParameter("content");
	
	System.out.println("content : "+content);
	System.out.println("id : "+ id);
	
	dto.setId(id);
	dto.setContent(content);
	
	boolean flag = dao.create(dto);
	
	String wdate = dto.getWdate();
	System.out.println("wdate : "+ wdate);
	int num = Integer.parseInt(request.getParameter("num"));
%>

{
	content:'<%=content %>',
	id:'<%=id %>',
	wdate:'<%=wdate %>',
	num:'<%=num %>
}

