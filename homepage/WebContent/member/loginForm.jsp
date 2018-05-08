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
<script type="text/javascript">
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
	
}
</script>
<title></title> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<form 	action="./loginProc.jsp"
		name="frm"
		method="post"
		onsubmit="return inCheck(this)"
>
<div class="container" style="margin-top:50px">
  <h2 style="text-align:center">Log in</h2>          
  <table class="table">
    <tbody>
      <tr>
        <td>ID</td>
        <td>
        	<input type="text" name="id">
        </td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" name="passwd"></td>
      </tr>
      <tr>
        <td colspan='2'>
        	<center><input type="submit" value="login"></center>
        </td>
      </tr>
    </tbody>
  </table>
 </div>
</form>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
