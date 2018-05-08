<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) {
		word = "";
	}
	
	//페이징관련
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	//리스트
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	
	List<MemberDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
<script type="text/javascript">

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="container" style="margin-top:100px">
  <table class="table" style="width:60%; margin:auto">
    <thead>
      <tr>
        <th colspan='3' style="text-align:center; font-size:22px">회원목록</th>
      </tr>
      <tr>
        <th>ID</th>
        <th>E-mail</th>
        <th>Tel</th>
      </tr>
    </thead>
<%if(list.size()==0) { %>
	<tbody>
      <tr>
        <td colspan='3' style="text-align:center">가입된 회원이 없습니다.</td>
      </tr>
    </tbody>
<%} else {
	for(int i=0; i<list.size(); i++) {
		MemberDTO dto = list.get(i);
%>
    <tbody>
      <tr>
        <td><%=dto.getId() %></td>
        <td><%=dto.getEmail() %></td>
        <td><%=dto.getTel() %></td>
      </tr>
    </tbody>
<%}
}
%>
  </table>
</div>

<div>
<%=paging %>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 