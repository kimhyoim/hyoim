<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.gustDAO"/>
<jsp:useBean id="dto" class="gust.gustDTO"/>
<%
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	
	dto.setContent(content);
	dto.setNum(num);
	
	boolean flag = dao.update(dto);
	
%>
