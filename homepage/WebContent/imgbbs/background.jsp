<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,100,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../covervid-gh-pages/assets/styles/normalize.css" />
<link rel="stylesheet" href="../covervid-gh-pages/assets/styles/styles.css" /> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
.covervid-wrapper {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
</style>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<!-- Video Markup -->
	<section class="masthead">
		<video class="masthead-video" style="width:100%" autoplay loop muted poster="assets/images/poster.jpg">
			<source src="../covervid-gh-pages/assets/videos/dreamscapes.mp4" type="video/mp4">
			<source src="../covervid-gh-pages/assets/videos/dreamscapes.webm" type="video/webm">
		</video>
		<div class="masthead-overlay"></div>
		<div class="masthead-arrow"></div>
		<h1>covervid<span>Background Video Cover</span></h1>
		<a class="masthead-video-credit" href="http://vimeo.com/82495711" target="_blank">
			<span>Video: Dreamscapes</span>
			<span>by Jonathan Besler</span>
		</a>
	</section>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
