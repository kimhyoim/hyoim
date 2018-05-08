<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	ImgBbsDTO dto = dao.read(num);
	
	
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
	if(f.fname.value=="") {
		alert("파일을 선택해주세요 !");
		f.fname.focus();
		return false;
	}
	if(f.title.value=="") {
		alert("제목을 입력해주세요 !");
		f.title.focus();
		return false;
	}
	if(f.content.value=="") {
		alert("내용을 입력해주세요 !");
		f.content.focus();
		return false;
	}
	if(f.pw.value=="") {
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
<div class="container">
<form 	action="./updateProc.jsp"
		method="post"
		enctype="multipart/form-data"
		onsubmit="return inCheck(this)"
>
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="oldfile" value="<%=dto.getFname() %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <table class="table">
    <tbody>
      <tr>
        <TH>이미지</TH>
        <TD>
        	<input type="file" name="fname" accept=".jpg,.png,.gif">
        	원본파일 : (<%=Utility.checkNull(dto.getFname()) %>)
        </TD>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" size="25" value="<%=dto.getTitle() %>"></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><textarea rows="5" cols="45"name="content"><%=dto.getContent() %></textarea></td>
      </tr>
      <tr>
        <th>작성자</th>
        <td><%=dto.getMname() %></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pw" size="10"></td>
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

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 