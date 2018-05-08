<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%

	String id = (String) session.getAttribute("id");

	String grade = dao.getGrade(id);

%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function mlogin() {
	var url = "<%=root %>/member/loginForm.jsp";

	wr = window.open(url, "Log in", "width=500, height=500");
	wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);

}
function mlogout() {
	var url = "<%=root %>/member/logout.jsp";
	
	location.href=url;
}
function msignup() {
	var url = "<%=root %>/member/agreement.jsp";
	
	location.href=url;
}
function mleave() {
	var url = "<%=root %>/member/deleteForm.jsp";
	
	location.href=url;
}


</script>
<style>
body {font-family: "Lato", sans-serif; background-color}
.mySlides {display: none}
</style>

<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="<%=root %>/index.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="#band" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Visited</a>
    <a href="#tour" class="w3-bar-item w3-button w3-padding-large w3-hide-small">To visit</a>
    <a href="<%=root %>/itinerary/list.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Itinerary</a>
    <a href="<%=root %>/imgbbs/list.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Image</a>
    <a href="<%=root %>/gust/list_0321.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Name book</a>
    <a href="<%=root %>/coverletter/coverletter.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">cover letter</a>
    <%if(id!=null) {%>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">MORE <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="<%=root %>/member/infoRead.jsp" class="w3-bar-item w3-button">My Info</a>
        <a href="#" class="w3-bar-item w3-button">My Travel</a>
        <a href="#" class="w3-bar-item w3-button">My Favorite</a>
      </div>
    </div>
    <%} %>
    <%if(id!=null && grade.equals("A")) { %>
    <a href="<%=root %>/admin/list.jsp" class="w3-padding-large w3-hover-red w3-hide-small w3-right">
    <span class="glyphicon glyphicon-lock"></span> 회원목록</a>
    <%} %>
    <%if(id==null) { %>
    <a href="javascript:mlogin()" class="w3-padding-large w3-hover-red w3-hide-small w3-right">
    <span class="glyphicon glyphicon-log-in" style="color:white"></span>
    </a>
    <a href="javascript:msignup()" class="w3-padding-large w3-hover-red w3-hide-small w3-right" style="color:white">
    Sign up
    </a>
    <%} else { %>
    <a href="javascript:mleave()" class="w3-padding-large w3-hover-red w3-hide-small w3-right">
    leave
    </a>
    <a href="javascript:mlogout()" class="w3-padding-large w3-hover-red w3-hide-small w3-right">
    <span class="glyphicon glyphicon-log-out"></span>
    </a>
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right">
    <i class="fa fa-search"></i>
    </a>
    <%} %>
  </div>
</div>


<script>


// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

</script>

</body>
</html>



