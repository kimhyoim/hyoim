<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
session.invalidate();//모든 세션변수 제거
 
response.sendRedirect("../index.jsp");
//세션에 저장되었던 아이디와 등급을 지우고 index페이지로 넘어감.
%>