<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	String str = "";
	
	if(dao.duplicateId(id)) {
		str = "duplicated ID ! Try again !<br><br>";
	} else if(dao.duplicateEmail(email)){
		str = "duplicated E-mail ! Try again !<br><br>";
	} else {
		request.setAttribute("request", request);
		//request영역에 데이터를 저장시키는 방법. 중복이 없으면 확인이 끝났으므로 createProc에 request 객체로 넘겨야한다.
		
%>
		<jsp:forward page="/member/createProc.jsp"/>
<%
		return;
	}
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br>
<p class="w3-opacity w3-center">
<%=str %>
<button type="button" onclick="history.back()">Try again</button>
</p>


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
