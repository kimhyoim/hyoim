<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.gustDAO"/>
<jsp:useBean id="dto" class="gust.gustDTO"/>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("id");
// 	String id = (String) request.getParameter("id");
	String content = request.getParameter("content");
	
	content = content.replaceAll("\r\n", "<br>");
	
	System.out.println("content : "+content);
	System.out.println("id : "+ id);
	
	dto.setId(id);
	dto.setContent(content);
	
	boolean flag = dao.create(dto);

%>


