<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="member.*" %>
<%@ page import="image.*" %>
<%@ page import="itinerary.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="gust.*" %>

<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
      
      //String tempDir = "/member/temp";
      //String upDir = "/member/storage";
      
      //tempDir = application.getRealPath(tempDir);
      //upDir = application.getRealPath(upDir);
      
      String tempDir = "/imgbbs/temp";
      String upDir = "/imgbbs/storage";
      
      tempDir = application.getRealPath(tempDir);
      upDir = application.getRealPath(upDir);
%> 
 
