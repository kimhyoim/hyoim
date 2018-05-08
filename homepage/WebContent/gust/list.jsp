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
	$("#panel").after(
		"<div style='width:25%; margin:auto; margin-bottom:10px; background-color:#aaabbb'>"+
		"작성자 : "+result.id+" "+result.wdate+"<br>"+
		result.content+
		"<input type='button' value='수정' onclick='updateform(result)'>"+
		"</div>"
	);
	$("#content").val("");
	$("#id").val("");
}

function updateform(result) {

	$("#panel2").hide();
	$("#panel2").before(
		"<div style='margin-top:10px; ; background-color:#aaabbb'>"+
		"<form name='update1' id='update1'>"+
		"작성자 : "+result.id+"<br>"+
		"<textarea id='updatecon' rows='3' cols='30'>"+
		result.content+
		"</textarea>"+
		"<input type='button' value='완료' onclick='sendUpdate()'>"+
		"</form>"+
		"</div>"+
		"<br>"
	);
	$("#content").val("");
	$("#id").val("");
}

function sendUpdate() {
	var content = $("#updatecon").val();
	var id = $("#id").val();
	var wdate = $("#wdate").val();
	var num = $("#num").val();
	
	$.post(
		"./update.jsp",
		{
			"content":content,
			"id":id,
			"wdate":wdate,
			"num":num
		}
		,
		function(data, textStatus) {
// 			alert(textStatus);
			result=eval("("+data+")");
			display2(result);
		}
	);
}

function display2(result) {
	$("#panel2").hide();
	$("#panel2").after(
		"<div style='width:25%; margin:auto; margin-bottom:10px; background-color:#aaabbb'>"+
		"작성자 : "+result.id+" "+result.wdate+"<br>"+
		result.content+
		"<input type='button' value='수정' onclick='updateform(result)'>"+
		"</div>"
	);
	$("#content").val("");
	$("#id").val("");
}


</script>
<style type="text/css">

</style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2 class="w3-wide" style="text-align:center; margin-top:100px">방명록</h2>

<div id="input_text" style="width:25%; margin:auto; margin-bottom:10px">
	<form name="input1" id="input1">
		<input type="text" id="id" value="" size="10"><br>
		<textarea id="content" rows="2" cols="53"></textarea><br>
		<input type="button" name="send" style="float:right" value="등록" onclick="sendContent()">
	</form>
</div>

<div id="panel"></div>

<%if(list.size()==0) { %>
<div id="panel2" style="width:25%; margin:auto; margin-bottom:10px; background-color:#aaabbb">작성된 내용이 없습니다.</div>
<%} else {
	for(int i=0; i<list.size(); i++) {
		gustDTO dto = list.get(i);
%>
<div id="panel2" style="width:25%; margin:auto; margin-bottom:10px; background-color:#aaabbb">
	<%=dto.getId() %> <%=dto.getWdate() %><br>
	<%String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	%>
	<%=content %>
	<input type='button' value='수정' onclick="updateform()">
	<br>
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