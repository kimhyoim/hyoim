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

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<FORM 	name='frm' 
		method='POST' 
		action='./deleteProc.jsp'
		>
		<input type="hidden" name="num" value = "<%=num %>">
		<input type="hidden" name="oldfile" value = "<%=request.getParameter("oldfile") %>">
		<input type="hidden" name="col" value = "<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value = "<%=request.getParameter("word") %>">
		<input type="hidden" name="nowPage" value = "<%=request.getParameter("nowPage") %>">
<div class="container">
  <table class="table">
    <thead>
      <tr>
        <th>비밀번호를 입력해주세요.</th>
        <th><input type="password" name="pw" size="10"></th>
      </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan='2' style="text-align:center">
        	<input type="submit" value="삭제">
        	<button type="button" onclick="history.back()">취소</button>
        </td>
    </tr>
    </tbody>
  </table>
</div>
</FORM>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 