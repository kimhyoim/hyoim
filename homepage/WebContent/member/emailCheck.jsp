<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String email = request.getParameter("email");
	
	boolean flag = dao.duplicateEmail(email);
	String str = "";
	
	if(flag) {
		str = "duplicated E-mail ! Try again !<br><br>";
	} else {
		str = "You can use this E-mail address !<br><br>";
	}

%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function use() {
	opener.frm.email.value='<%=email %>';
	//opener가 createForm의 document를 가르킨다.
	self.close();
}
function notuse() {
	opener.frm.email.value='<%="" %>';
	//opener가 createForm의 document를 가르킨다.
	self.close();
}
</script>
</head> 
<!-- *********************************************** -->
<body>

<div style="text-align:center">
<% if(flag) { %>
<%=str %>
<button type='button' onclick='notuse()'>Try again</button>
<%} else {%>
<%=str %>
<button type='button' onclick='use()' style='text-align:center'>Use it</button>
<%} %>
</div>

</body>
<!-- *********************************************** -->
</html> 
