<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="itinerary.ItinDAO"/>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) {
		word = "";
	}
	//페이징 관련
	int nowPage = 1;
	int recordPerPage = 5;
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	//리스트
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<ItinDTO> list = dao.list(map);
	
	//페이징
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
function iread(num) {
	var url = "./read.jsp";
	url += "?num="+num;
	
	location.href = url;
}
function icreate() {
	var url = "./createFormMapTest.jsp";
	
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br><br>
<h2 class="w3-wide" style="text-align:center; margin-top:100px">
<span class="glyphicon glyphicon-picture"></span> Itinerary</h2>
<div class="container">
  <table class="table" style="width:60%; margin:auto">
    <thead>
      <tr>
        <th>글번호</th>
        <th>여행지</th>
        <th>작성자</th>
        <th>여행기간</th>
      </tr>
    </thead>
<% if(list.size()==0) {%>
	<tbody>
      <tr>
        <td colspan='3' style="text-align:center">작성된 글이 없습니다.</td>
      </tr>
	</tbody>
<%} else {
	for(int i=0; i<list.size(); i++) {
		ItinDTO dto = list.get(i);
%>
    <tbody>
      <tr>
        <td><%=dto.getNum() %></td>
        <td><a href="javascript:iread('<%=dto.getNum() %>')"><%=dto.getSite() %></a></td>
        <td><%=dto.getId() %></td>
        <td><%=dto.getPeriod() %></td>
      </tr>
    </tbody>
        <%}
}%>
  </table>

</div>

<div class="search" style="text-align:center; magin-top:8px">
	<form action="./list.jsp" method="post">
		<select name="col">
			<option value="id" <%if(col.equals("id")) out.print("seleted"); %>
			>작성자</option>
			<option value="site" <%if(col.equals("site")) out.print("seleted"); %>
			>여행지</option>
			<option value="period" <%if(col.equals("period")) out.print("seleted"); %>
			>여행기간</option>
			<option value="total">전체표시</option>
		</select>
		<input type="text" name="word" required value="<%=word %>">
		<button>검색</button>
		<button type="button" onclick="icreate()">등록</button>
	</form>
</div>

<div>
<%=paging %>
</div>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->