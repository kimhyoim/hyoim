<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("passwd",passwd);
	
	boolean flag = dao.loginCheck(map);
	String grade = null;
	String str = "";
	
	if(flag) {
		str = "Login success !";
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
// 		response.sendRedirect("../index.jsp");
	} else {
		str = "Login fail ! Try again !";
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
<script type="text/javascript">
function goIndex() {
	opener.parent.location.reload();
	self.close();
}
</script>
<title></title> 
</head> 
<!-- *********************************************** -->
<body>

<p class="w3-justify" style="margin-top:100px">
<%if(flag==false) {%>
<%=str %>
<button type="button" onclick="location.href='./loginForm.jsp'">Try again</button>
<%} else {%>
<%=str %>
<button type="button" onclick="goIndex()">Home Page</button>
<%} %>
</p>

</body>
<!-- *********************************************** -->
</html> 
