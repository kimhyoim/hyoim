<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>
<jsp:useBean id="dto" class="image.ImgBbsDTO"/>
<%
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String id = upload.getParameter("id");
	String mname = upload.getParameter("mname");
	String title = upload.getParameter("title");
	String content = upload.getParameter("content");
	String pw = upload.getParameter("pw");
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	
	if(size>0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setId(id);
	dto.setMname(UploadSave.encode(mname));
	dto.setTitle(UploadSave.encode(title));
	dto.setContent(UploadSave.encode(content));
	dto.setPw(pw);
	dto.setFname(fname);
	dto.setFilesize(size);
	
	boolean flag = dao.create(dto);
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
	
	location.href = url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<br>
<p class="w3-opacity w3-center">
<%if(flag) { %>
등록성공
<button type="button" onclick="imglist()">목록으로</button>
<%} else { %>
등록실패
<button type="button" onclick="history.back()">다시시도</button>
<%} %>
</p>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 