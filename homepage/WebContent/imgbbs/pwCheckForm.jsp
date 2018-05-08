<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
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
function inCheck(f) {
	if(f.pw.value="") {
		alert("비밀번호를 입력해주세요 !");
		f.pw.focus();
		return false;
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<form 	action="./updateForm.jsp"
		method="post"
		onsubmit="return inCheck(this)"
>
<input type="hidden" name="num" value="<%=num %>">
<div class="container">
  <table class="table">
    <thead>
      <tr>
        <th>비밀번호를 입력해주세요.</th>
        <th>
        	<input type="password" name="pw" size="10">
        </th>
      </tr>
    </thead>
  </table>
</div>
</form>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 