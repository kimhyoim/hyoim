<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%
	String id = (String) session.getAttribute("id");
	//궁극적 목표는 구글 지도에서 저장한것까지 저장하고 불러올 수 있게 만드는것.
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title></title>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->


<div class="container">
<form	action="./createProc.jsp"
		method="post"
		onsubmit="return inCheck(this)"
>
<br><br><br>
<input type="hidden" name="id" value="<%=id %>">
  <table class="table" style="width:60%; margin:auto">
  <thead>
      <tr>
        <th colspan='2' style="text-align:center">여행 일정등록</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>여행지</th>
        <td>
        	<input type="text" name="site" size="25">
        </td>
      </tr>
      <tr>
        <th>기간</th>
        <td><input type="text" name="period" size="50"></td>
      </tr>
      <tr>
        <th>위도</th>
        <td><input type="text" name="lat" size="10"></td>
      </tr>
      <tr>
        <th>경도</th>
        <td><input type="text" name="lng" size="10"></td>
      </tr>
      <tr>
        <th>여행일정</th>
        <td><textarea name="content" rows="20" cols="75"></textarea></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type="submit" value="등록">
        	<button type="button" onclick="history.back()">취소</button>
        </td>
      </tr>
    </tbody>
  </table>
</form>
</div>

<!-- Add Google Maps -->
<div style="height:300px; width:1000px; margin:auto; margin-bottom:10px">
<jsp:include page="../googleAPI/mapAPI.html"/>
</div>


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 


