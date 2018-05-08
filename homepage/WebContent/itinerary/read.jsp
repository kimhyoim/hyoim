<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="itinerary.ItinDAO"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	ItinDTO dto = dao.read(num);
	String content = dto.getContent();
	content.replaceAll("\r\n", "<br>");
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
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
<script type="text/javascript">

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br><br>

<div class="container" style="position: relative; left:30px">
  <table class="table" style="width:60%">
  <thead>
      <tr>
        <th colspan='2' style="text-align:center">여행 일정</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>여행지</th>
        <td><%=dto.getSite() %>
      </tr>
      <tr>
        <th>기간</th>
        <td><%=dto.getPeriod() %></td>
      </tr>
      <tr>
        <th>여행일정</th>
        <td><%=content %></td>
      </tr>
      <tr>
        <th>장소</th>
        <td>
        	<%=dto.getLat() %>
        	<%=dto.getLng() %>
        </td>
      </tr>
      
      <tr>
        <td colspan='2' style="text-align:center">
        	<button type="button" onclick="iupdate()">수정</button>
        	<button type="button" onclick="history.back()">목록</button>
        	<button type="button" onclick="history.back()">삭제</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<!-- Add Google Maps -->
<div style="height:300px; width:1000px; margin:auto; margin-bottom:10px">
<jsp:include page="../googleAPI/mapAPI.jsp">
	<jsp:param value="<%=dto.getLng() %>" name="lng"/>
	<jsp:param value="<%=dto.getLat() %>" name="lat"/>
</jsp:include>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 