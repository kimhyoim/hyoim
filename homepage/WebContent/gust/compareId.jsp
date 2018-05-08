<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.gustDAO"/>

<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("num", num);
	
	boolean iflag = dao.compareId(map);
	boolean flag = false;
	String str = "";
	
	if(iflag) {
		flag = dao.delete(num);
		if(flag) {
			str = "삭제 성공";
		} else {
			str = "삭제 실패";
		}
	} else {
		str = "다른사람의 글은 지울 수 없습니다.";
	}
%>
{
	str:'<%=str %>'
}