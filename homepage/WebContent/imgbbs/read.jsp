<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImgBbsDAO"/>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	dao.upViewcnt(num);
	
	ImgBbsDTO dto = dao.read(num);
	
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
<style type="text/css"> 

.imgread{

}

.curImg{
	margin-right:1px;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
	text-align:center;
}

</style> 
<script type="text/javascript">
function readGo(num){
	var url = "./read.jsp";
	url += "?num="+num;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";
	location.href = url;
}
function imglist() {
	var url = "./list.jsp";
	url += "?col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";
	
	location.href = url;
}
function imgupdate(num) {
	var url = "./updateForm.jsp";
	url += "?num="+num;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";
	
	location.href=url;
}
function imgdelete(num) {
	var url = "./deleteForm.jsp";
	url += "?num="+num;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	url += "&nowPage=<%=nowPage %>";
	url += "&oldfile=<%=dto.getFname() %>";
	
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<h2 class="w3-wide" style="text-align:center; margin-top:100px">
<span class="glyphicon glyphicon-picture"></span> 사진첩</h2>
<div class="container" style="position: relative; left: 250px">
  <table class="table" style="width:50%">
    <tbody>
      <tr>
        <td colspan='2' style="text-align:center">
        	<img src="./storage/<%=dto.getFname() %>" style="width:500px; height:500px">
        </td>
      </tr>
      <tr>
        <td>title</td>
        <td><%=dto.getTitle() %></td>
      </tr>
      <tr>
        <td>content</td>
        <td><%=content %></td>
      </tr>
    </tbody>
  </table>
</div>

<div style="position: absolute; left:1050px; top:200px">
  <TABLE class="imgread" style="width: 5%">

  <%
  	List list = dao.imgRead(num);
    String[] files = (String[])list.get(0);
    //0번째 인덱스에 file이름이 전부 저장돼 있음
    int[] noArr = (int[])list.get(1);
    //1번째 인덱스에 no가 전부 저장돼 있음
    for(int i=0;i<5;i++){ 
  %>
  <% 
    	if(files[i]==null){  
  %>
  <tr>
  <td class="td_padding"><img src="./storage/default.jpg" style="width:75px; height:75px"></td>
  </tr>
  <%
    	}else{
    		if(noArr[i]==num){//지금 보고 있는 이미지와 같은 이미지일 경우
  %> 	
  <tr>
  <td class="td_padding">
  	<a href="javascript:readGo('<%=noArr[i]%>')">
  		<img class="curImg" src="./storage/<%=files[i] %>" style="width:75px; height:75px" >
  	</a>
  </td>
  </tr>
  <%		
    		}else{//아닌경우
  %>
  <tr>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" style="width:75px; height:75px; border:0">
  </a></td>
  </tr>		
  <%	}
	}  
}
%>
  </TABLE>
</div>

  <DIV class='bottom' style="text-align:center; padding:5px">
    <input type='button' value='목록' onclick="imglist()">
  	<input type='button' value='수정' onclick="imgupdate('<%=num %>')">
  	<input type='button' value='삭제' onclick="imgdelete('<%=num %>')">
  </DIV>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 