<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	
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
<script type="text/javascript">
function emailCheck(email) {
	if(email=="") {
		alert("please enter an email address.");
		document.frm.id.focus();
	} else {
		var url = "./emailCheck.jsp";
		url += "?email="+email;
		
		wr = window.open(url, "confirm_email", "width=500, height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	}
	
}
function inCheck(f) {
	
	if(f.email.value=="") {
		alert("please enter an E-mail.");
		f.email.focus();
		return false;
	}
	if(f.tel.value=="") {
		alert("please enter a Tel Number.");
		f.tel.focus();
		return false;
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<form 	action="./updateProc.jsp"
		name="frm"
		method="post"
		onsubmit="return inCheck(this)"
>
<input type="hidden" name="id" value="<%=dto.getId() %>">
<br><br><br>
<div class="container">
  <h2 style="text-align:center">Update Info</h2>        
  <table class="table">
    <thead>
      <tr>
        <th>Item</th>
        <th>Please click check buttons !</th>
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
        <td><input type="text" name="email" size="25" placeholder="<%=dto.getEmail() %>">
        <button type="button" onclick="emailCheck(document.frm.email.value)">Check</button></td>
      </tr>
      <tr>
        <td>Tel</td>
        <td><input type="text" name="tel" size="15" placeholder="<%=dto.getTel() %>"></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type='submit' value='Update'>
        	<button type="button" onclick="history.back()">back</button>
        </td>
      </tr>
    </tbody>
  </table>
 </div>
</form>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
