<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>
<jsp:useBean id="dao" class="gust.gustDAO" />

<%
	int num = Integer.parseInt(request.getParameter("num"));

	gustDTO dto = dao.read(num);
	
	String content = dto.getContent();
	content.replaceAll("\r\n", "<br>");
%>
<%
	JSONObject obj = new JSONObject();
	if(dto!=null) {
		obj.put("id", dto.getId());
		obj.put("wdate", dto.getWdate());
		obj.put("num", dto.getNum());
		obj.put("content", content);
	}
	out.print(obj);
%>
