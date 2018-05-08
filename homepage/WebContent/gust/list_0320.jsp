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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function sendContent() {
	var content = $("#content").val();
	var id = $("#id").val();
	
	$.post(
		"./get.jsp",
		{
			"content":content,
			"id":id
		}
		,
		function(data, textStatus) {
// 			alert(textStatus);
			result=eval("("+data+")");
			display(result);
		}
	);
}

function display(result) {
	$("#panel").hide();
	$("#panel").before(
		"<div style='margin-top:10px; ; background-color:#aaabbb'>"+
		"작성자 : <p id='id2'>"+result.id+"</p><br>"+
		"<p id='con2'"+result.content+"</p>"+
		"<input type='button' value='수정' onclick='updateform()'>"+
		"</div>"+
		"<br>"
	);
	$("#content").val("");
	$("#id").val("");
}

function updateform() {
	
	var content = $("#con2").val();
	var id = $("#id2").val();
	
	$("#panel").hide();
	$("#panel").before(
		"<div style='margin-top:10px; ; background-color:#aaabbb'>"+
		"<form name='update1' id='update1'>"+
		"작성자 : "+id+"<br>"+
		"<textarea id='updatecon' rows='3' cols='30'>"+
		content+
		"</textarea>"+
		"<input type='button' value='완료' onclick='sendUpdate()'>"+
		"</form>"+
		"</div>"+
		"<br>"
	);
	$("#content").val("");
	$("#id").val("");
}
</script>
<style type="text/css">
div{
	border:1px solid black;
}
</style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2 class="w3-wide" style="text-align:center; margin-top:100px">방명록</h2>

<div id="input_text" style="margin-top:10px; margin-bottom:10px">
	<form name="input1" id="input1">
		<input type="text" id="id" value="" size="10"><br>
		<textarea id="content" rows="3" cols="30"></textarea>
		<input type="button" name="send" value="등록" onclick="sendContent()">
	</form>
</div>

<%if(list.size()==0) { %>
<div id="panel" style="margin-bottom:10px; ; background-color:#aaabbb">작성된 내용이 없습니다.</div>
<%} else {
	for(int i=0; i<list.size(); i++) {
		gustDTO dto = list.get(i);
%>
<div id="panel" style="margin-bottom:10px; ; background-color:#aaabbb">
	<p id='id2'><%=dto.getId() %></p>
	<%=dto.getWdate() %><br>
	<%String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	%>
	<p id='con2'><%=content %></p>
	<input type='button' value='수정' onclick="updateform('<%=dto.getNum() %>')">
</div>
<%}
}%>

<div id="bottom">
<%=paging %>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 