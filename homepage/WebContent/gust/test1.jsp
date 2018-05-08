<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gust.gustDAO"/>

<%
	//검색관련 
	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) {
		word ="";
	}
	
	//페이지 관련
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 10;
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	//리스트 관련
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<gustDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
	//페이징
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title></title>
<script type="text/javascript">

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2 class="w3-wide" style="text-align:center; margin-top:100px">방명록</h2>
<div class="container" style="width:60%; margin:auto; margin-bottom:20px;background-color:#fffeee">
<jsp:include page="test1.html" flush="true"/>
</div>

<table>
<%if(list.size()==0) { %>
	<tr>
		<td colspan='2'>등록된 내용이 없습니다.</td>
	</tr>
<%} else {
	for(int i=0; i<list.size(); i++) {
		gustDTO dto = list.get(i);
%>
	<tr>
		<td>작성자 : <%=dto.getId() %> </td>
		<td>작성일 : <%=dto.getWdate() %></td>
	</tr>
	<tr>
		<td colspan='2'>
		<%String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		%>
		<%=content %>
		</td>
	</tr>
<%}
}%>
</table>



<div id="bottom">
<%=paging %>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 