<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	String id = request.getParameter("id");
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

	if(f.passwd.value=="") {
		alert("please enter a password.");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value=="") {
		alert("please enter again your password.");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value) {
		alert("Two passwords are not same.\n please check the password. ");
		f.repasswd.focus();
		return false;
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<form 	action="./pwUpdateProc.jsp"
		name="frm"
		method="post"
		onsubmit="return inCheck(this)"
>
<input type="hidden" name="id" value="<%=id %>">
<div class="container">
  <h2 style="text-align:center">Change Password</h2>        
  <table class="table">
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
        	<%=id %>
        </td>
      </tr>
      <tr>
        <td>Current Password</td>
        <td><input type="password" name="oldpw" placeholder="put in the current password"></td>
      </tr>
      <tr>
        <td>New Password</td>
        <td><input type="password" name="passwd" placeholder="more than 8 word"></td>
      </tr>
      <tr>
        <td>Confirm Password</td>
        <td><input type="password" name="repasswd" placeholder="Please confirm password"></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type='submit' value='Update'>
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
