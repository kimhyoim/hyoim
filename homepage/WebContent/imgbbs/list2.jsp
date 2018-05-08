<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>

<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) {
		word="";
	}
	
	//페이징 관련
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	//리스트
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<ImgBbsDTO> list = dao.list(map);
	
	//페이징
	int totalRecord = dao.total(map);
	
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="//vjs.zendcdn.net/4.9/video.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title></title>
<style type="text/css">
 #videobcg { 
    position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
} 
table {
    border-collapse: collapse;
    border-spacing: 0;
    color: white;
    
}
</style>
<script type="text/javascript">
function read(num) {
	var url = "./read.jsp";
	url += "?num="+num;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";
	
	location.href = url;
}
function icreate() {
	var url = "./createForm.jsp";
	
	location.href = url;
}
function fileDown(filename) {
	var url = "<%=root %>/download";
	url += "?filename="+filename;
	url += "&dir=/imgbbs/storage";
	
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2 class="w3-wide" style="text-align:center; margin-top:200px; color:white">
<span class="glyphicon glyphicon-picture" style="color:white"></span> 사진첩</h2>

<div class="container" style="width:50%">
  <table class="table">
    <thead>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>이미지</th>
      </tr>
    </thead>
<%if(list.size()==0) { %>
	<tbody>
      <tr>
        <td colspan='5' style="text-align:center">작성된 글이 없습니다.</td>
      </tr>
    </tbody>
<%} else {
	for(int i=0; i<list.size(); i++) {
		ImgBbsDTO dto = list.get(i);
%>
    <tbody>
      <tr>
        <td><%=dto.getNum() %></td>
        <td>
        	<a href="javascript:read('<%=dto.getNum() %>')"><%=dto.getTitle() %></a>
        	<%
			if(Utility.compareDay(dto.getWdate())) { %>
			<img src="../images/new.gif">
			<%		
			}
			%>
        </td>
        <td><%=dto.getMname() %></td>
        <td>
        	<a href="javascript:fileDown('<%=dto.getFname() %>')">
        		<img src="./storage/<%=dto.getFname() %>" style="width:50px; height:50px">
        	</a>
        </td>
      </tr>
    </tbody>
<%}
}
%>
 </table>
 
<div class="search" style="text-align:center; margin-top:8px">
<form action="list.jsp" method="POST" >
<!-- 검색 후 같은 페이지가 나와야되서 -->
<select name="col"><!-- 검색할 컬럼 -->
	<option value="mname" <%if(col.equals("mname")) out.print("selected"); %>
	>작성자</option>
	<option value="title" <%if(col.equals("title")) out.print("selected"); %>
	>제목</option>
	<option value="content" <%if(col.equals("content")) out.print("selected"); %>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<input type="search" name="word" required value="<%=word %>"><!-- 검색할 단어 -->
<button>검색</button>
<button type="button" onclick="icreate()">등록</button>
</form>
</div>
<br>
  <DIV class='bottom' style="magin:7px">
  	<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  	<br>
  </DIV>

  
</div>

<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"
class="video-js vjs-default-skin" data-setup="{}">
<source src="../covervid-gh-pages/assets/videos/dreamscapes.mp4" type="video/mp4"/>
</video>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 