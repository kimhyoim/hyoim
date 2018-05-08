<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("passwd", passwd);
	
	boolean flag = dao.delete(map);
	if(flag) {
		session.invalidate();
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

<p class="w3-justify">
<%if(flag) { %>
Good bye !
<button type="button" onclick="location.href='<%=root %>/index.jsp'">Home</button>
<%} else { %>
Leave fail ! Check your password !
<button type="button" onclick="location.href='./deleteForm.jsp'">Try again</button>
<%} %>
</p>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
