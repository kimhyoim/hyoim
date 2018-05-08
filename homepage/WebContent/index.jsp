<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = (String) session.getAttribute("id");
	String grade = dao.getGrade(id);
	
	String str = null;
	if(id==null) {
		str = "Please join us !";
	} else if(grade.equals("A")) {
		str = "Administrator Login";
	} else {
		str = "Hello "+id+"! <br>Welcome to our site !<br>";
	}


%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">
   <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="<%=root %>/images/kyoto.jpg" style="width:65%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>교토</h3>
      <p><b>일본 교토</b></p>   
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="<%=root %>/images/osaka.jpg" style="width:65%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>오사카</h3>
      <p><b>일본 오사카</b></p>    
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="<%=root %>/images/hokkaido.jpg" style="width:65%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      <h3>홋카이도</h3>
      <p><b>일본 홋카이도</b></p>    
    </div>
  </div>

  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    <h2 class="w3-wide">THE TRAVELERS</h2>
    <p class="w3-opacity"><i>We love travel</i></p>
    <p class="w3-justify">
    We have traveled a lot of sites.<br>
    And we will travel all over the world !<br>
    Below, the pictures that we already have visited places.<br>
    <%if(id==null) {%>
    <%=str %><br>
    <%} else if(grade.equals("A")) {%>
    <%=str %><br>
    <%} else { %>
    <%=str %>
    <%} %>
    Share your amazing experience and emotion !
    </p>
    <div class="w3-row w3-padding-32">
      <div class="w3-third">
        <p>Japan-Osaka</p>
        <img src="<%=root %>/images/osaka.jpg" class="minipic" alt="Random Name" style="width:60%">
      </div>
      <div class="w3-third">
        <p>Japan-Kyoto</p>
        <img src="<%=root %>/images/kyoto.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:60%">
      </div>
      <div class="w3-third">
        <p>Japan-Hokkaido</p>
        <img src="<%=root %>/images/hokkaido.jpg" class="w3-round" alt="Random Name" style="width:60%">
      </div>
    </div>
  </div>
      <!-- The Tour Section -->
  <div class="w3-black" id="tour">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">Travel List</h2>
      <p class="w3-opacity w3-center"><i>My itinerary</i></p><br>

      <ul class="w3-ul w3-border w3-white w3-text-grey">
        <li class="w3-padding">2014 <span class="w3-badge w3-right w3-margin-right">0</span></li>
        <li class="w3-padding">2015 <span class="w3-badge w3-right w3-margin-right">2</span></li>
        <li class="w3-padding">2016 <span class="w3-badge w3-right w3-margin-right">0</span></li>
        <li class="w3-padding">2017 <span class="w3-badge w3-right w3-margin-right">1</span></li>
        <li class="w3-padding">2018 <span class="w3-badge w3-right w3-margin-right">0</span></li>
      </ul>

      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <img src="<%=root %>/images/boracay.jpg" alt="boracay" style="width:245px; height:138px" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Boracay</b></p>
            <p class="w3-opacity">2~6 Feb 2015</p>
            <p>Boracay. Philippine</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Itinerary</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="<%=root %>/images/osaka.jpg" alt="Osaka" style="width:245px; height:138px" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Osaka</b></p>
            <p class="w3-opacity">24~26 Sept 2017</p>
            <p>Osaka. Japan</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Itinerary</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="<%=root %>/images/namisum.jpg" alt="Continued" style="width:245px; height:138px" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>Namisum</b></p>
            <p class="w3-opacity">15~16 May 2015</p>
            <p>Namisum, Korea</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('ticketModal').style.display='block'">Itinerary</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
<script type="text/javascript">
//Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}
</script>


<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
