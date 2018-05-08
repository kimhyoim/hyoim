<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="//vjs.zendcdn.net/4.9/video.js"></script>
<title></title>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br><br><br>
<div class="container">
<jsp:include page="./coverletter.html"/>
</div>

<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"
class="video-js vjs-default-skin" data-setup="{}">
<source src="../covervid-gh-pages/assets/videos/dreamscapes.mp4" type="video/mp4"/>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 