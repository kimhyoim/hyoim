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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<form 	action="./deleteProc.jsp"
		name="frm"
		method="post"
		onsubmit="return inCheck(this)"
>

<div class="container">
  <h2 style="text-align:center">Leave</h2>        
  <table class="table">
    <thead>
      <tr>
        <th colspan='2'>If you leave, your information will be destroyed and can't be restored. </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Input your password</td>
        <td><input type="password" name="passwd"></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type='submit' value='leave'>
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
