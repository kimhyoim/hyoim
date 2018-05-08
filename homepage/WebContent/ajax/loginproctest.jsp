<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("passwd",passwd);
	
	boolean flag = dao.loginCheck(map);
	String grade = null;
	String str = "";
	
	if(flag) {
		//로그인이 성공하면 입력창을 인삿말과 회원정보버튼, 로그아웃 버튼으로 만들자.
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
// 		response.sendRedirect("../index.jsp");
		out.print(id+"님 반갑습니다.");
	} else {
		//실패시 새창으로 경고창을 띄우는게 좋겠다.
		str = "Login fail ! Try again !";
		out.println(str);
		out.println("<input type='button' value='Back' onclick='goBack()'>");
	}

%>