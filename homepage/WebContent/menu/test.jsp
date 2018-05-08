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

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="container">
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
        <td><input type="text" name="email" size="25"></td>
        <button type="button" onclick="emailCheck(document.frm.email.value)">Check</button>
      </tr>
      <tr>
        <td>Tel</td>
        <td><input type="text" name="tel" size="15"></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 