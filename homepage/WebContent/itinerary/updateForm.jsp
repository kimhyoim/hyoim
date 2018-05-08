<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="itinerary.ItinDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	ItinDTO dto = dao.read(num);
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


<div class="container" style="position: relative; left:30px">
<form	action="./createProc.jsp"
		method="post"
		onsubmit="return inCheck(this)"
>
<br><br><br>
<input type="hidden" name="id" value="<%=dto.getId() %>">
  <table class="table" style="width:60%">
  <thead>
      <tr>
        <th colspan='2' style="text-align:center">여행 일정</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>여행지</th>
        <td>
        	<input type="text" name="site" size="25" value="<%=dto.getSite() %>">
        </td>
      </tr>
      <tr>
        <th>기간</th>
        <td><input type="text" name="period" size="50" value="<%=dto.getPeriod() %>"></td>
      </tr>
      <tr>
        <th>여행일정</th>
        <td><textarea name="content" rows="20" cols="75" value="<%=dto.getContent() %>"></textarea></td>
      </tr>
      <tr>
        <td colspan='2' style="text-align:center">
        	<input type="submit" value="수정">
        	<button type="button" onclick="history.back()">취소</button>
        </td>
      </tr>
    </tbody>
  </table>
</form>
</div>

<aside>
<!-- Add Google Maps -->
<div id="googleMap" style="height:500px; width:400px; position: absolute; right:230px; top:100px" class="w3-grayscale-max"></div>
</aside>
<script>
function myMap() {
  myCenter=new google.maps.LatLng(41.878114, -87.629798);
  var mapOptions= {
    center:myCenter,
    zoom:12, scrollwheel: false, draggable: false,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

  var marker = new google.maps.Marker({
    position: myCenter,
  });
  marker.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8oeuxhppdjaIWkfUTdkE7N232gDIH6mc&callback=myMap"></script>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 