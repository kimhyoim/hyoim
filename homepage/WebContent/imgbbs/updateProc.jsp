<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>
<jsp:useBean id="dto" class="image.ImgBbsDTO"/>

<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setNum(Integer.parseInt(upload.getParameter("num")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPw(UploadSave.encode(upload.getParameter("pw")));

	String nowPage = upload.getParameter("nowPage");
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("fname");
	//물리적인 파일을 객체형태로 여러 메소드로 조작하기 위해서.
	
	int size = (int) fileItem.getSize();
	String fname = null;
	
	
	
	Map map = new HashMap();
	map.put("num", dto.getNum());
	map.put("pw", dto.getPw());
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	
	if(pflag) {
		if(size>0) {
			//삭제에만 관여하는 부분. 사진을 교체하는 것과는 무관하다. 아래에서 이뤼진다.
			if(oldfile!=null && !oldfile.equals("default.jpg")) {
				//default값인 member.jpg는 삭제하면 안되므로 조건문을 써준다.
				UploadSave.deleteFile(upDir, oldfile);
			}
			fname = UploadSave.saveFile(fileItem, upDir);
			//storage안에 실제 파일을 담기 위한 과정
			//전송되는 파일은 경로+파일명.
		}
		dto.setFname(fname);
		dto.setFilesize(size);
		
		flag = dao.update(dto);
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
	url += "?col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";

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
        <th>수정 성공 !</th>
        <th>
        	<button type="button" onclick="imglist()">목록으로</button>
        </th>
      </tr>
    </thead>
  <%} else { %>
  	<thead>
      <tr>
        <th>수정 실패 !</th>
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