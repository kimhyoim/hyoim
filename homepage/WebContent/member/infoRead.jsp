<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = (String) session.getAttribute("id");
	MemberDTO dto = dao.read(id);
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
function mupdate(id) {
	var url = "updateForm.jsp";
	url += "?id="+id;
	
	location.href=url;
}
function pwUpdate(id) {
	var url = "pwUpdateForm.jsp";
	url += "?id="+id;
	
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<div class="container" style="margin-top:100px">
  <h2 style="text-align:center">My info</h2>
  
  <table class="table" style="width:60%; margin:auto">
    <thead>
      <tr>
        <th>Item</th>
        <th>Info</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>ID</td>
        <td>
        	<%=dto.getId() %>
        </td>
      </tr>
      <tr>
        <td>E-mail</td>
        <td><%=dto.getEmail() %></td>
      </tr>
      <tr>
        <td>Tel</td>
        <td><%=dto.getTel() %></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        <button type="button" onclick="mupdate('<%=dto.getId() %>')">Update Info</button>
        <button type="button" onclick="pwUpdate('<%=dto.getId() %>')">Change Password</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
