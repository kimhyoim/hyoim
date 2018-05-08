<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

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
function idCheck(id) {
	if(id=="") {
		alert("please enter an ID.");
		document.frm.id.focus();
	} else {
		var url = "./idCheck.jsp";
		url += "?id="+id;
		
		wr = window.open(url, "confirm_id", "width=300, height=150");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	}
	
}
function emailCheck(email) {
	if(email=="") {
		alert("please enter an email address.");
		document.frm.id.focus();
	} else {
		var url = "./emailCheck.jsp";
		url += "?email="+email;
		
		wr = window.open(url, "confirm_email", "width=300, height=150");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
	}
	
}
function inCheck(f) {
	
	if(f.id.value=="") {
		alert("please enter an ID.");
		f.id.focus();
		return false;
	}
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
<br><br><br>
<form 	action="./precreateProc.jsp"
		name="frm"
		method="post"
		onsubmit="return inCheck(this)"
>
<div class="container">
  <h2 style="text-align:center">Sign up</h2>
  <p style="text-align:center">Only 4 items, you have to be filled in !</p>            
  <table class="table" style="width:60%; margin:auto">
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
        	<input type="text" name="id" placeholder="English,Arabic numerals">
        	<button type="button" onclick="idCheck(document.frm.id.value)">Check</button>
        </td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" name="passwd" placeholder="more than 8 word"></td>
      </tr>
      <tr>
        <td>Confirm Password</td>
        <td><input type="password" name="repasswd" placeholder="Please confirm password"></td>
      </tr>
      <tr>
        <td>E-mail</td>
        <td><input type="text" name="email" size="25">
        <button type="button" onclick="emailCheck(document.frm.email.value)">Check</button>
        </td>
      </tr>
      <tr>
        <td>Tel</td>
        <td><input type="text" name="tel" size="15"></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type='submit' value='Sign up'>
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
