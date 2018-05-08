<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>
<jsp:useBean id="dto" class="image.ImgBbsDTO"/>
<%
	String oldfile = Utility.checkNull(request.getParameter("oldfile"));
	dto.setNum(Integer.parseInt(request.getParameter("num")));
	dto.setPw(request.getParameter("pw"));
	
	Map map = new HashMap();
	map.put("num", dto.getNum());
	map.put("pw", dto.getPw());
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	
	if(pflag) {
		flag = dao.delete(dto.getNum());
	}
	if(flag) {
		UploadSave.deleteFile(upDir, oldfile);
	}
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
function imglist() {
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word") %>";
	url += "&nowPage=<%=request.getParameter("nowPage") %>";
	
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<div class="container">
  <table class="table">
  <%if(pflag==false) {%>
    <thead>
      <tr>
        <th>비밀번호가 다릅니다 !</th>
        <th>
        	<button type="button" onclick="history.back()">다시시도</button>
        </th>
      </tr>
    </thead>
  <%} else {
	  if(flag) { %>
	  <thead>
      <tr>
        <th>삭제 성공 !</th>
        <th>
        	<button type="button" onclick="imglist()">목록으로</button>
        </th>
      </tr>
    </thead>
  <%} else { %>
  	<thead>
      <tr>
        <th>삭제 실패 !</th>
        <th>
        	<button type="button" onclick="history.back()">다시시도</button>
        </th>
      </tr>
    </thead>
  <%}
  }%>
  </table>
</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 