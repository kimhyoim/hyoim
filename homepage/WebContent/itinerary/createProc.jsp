<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="itinerary.ItinDAO"/>
<jsp:useBean id="dto" class="itinerary.ItinDTO"/>
<<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = dao.create(dto);
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
function itlist() {
	var url = "./list.jsp";
	
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br>
<br>
<br>
<p class="w3-opacity w3-center">
<%if(flag) { %>
등록성공
<button type="button" onclick="itlist()">목록으로</button>
<%} else { %>
등록실패
<button type="button" onclick="history.back()">다시시도</button>
<%} %>
</p>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 