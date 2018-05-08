<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%@ page import="org.json.simple.*" %>
<<jsp:useBean id="dao" class="gust.gustDAO"/>

<%
//검색관련 
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}

	//페이지 관련
	int nowPage = 1;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 10;
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	//리스트 관련
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<gustDTO> list = dao.list(map);

	int totalRecord = dao.total(map);
%>
<%
	if(list.size()==0) {
		out.print("등록된 글이 없습니다.");
	} else {
		JSONArray Jlist = new JSONArray();
		for(int i=0; i<list.size(); i++) {
			gustDTO dto = list.get(i);
			String content = dto.getContent();
			content = content.replaceAll("<br>", "\r\n");
			JSONObject obj = new JSONObject();
			obj.put("id", dto.getId());
			obj.put("content", content);
			obj.put("wdate", dto.getWdate());
			obj.put("num", dto.getNum());
			
			if(obj!=null) {
				Jlist.add(obj);
			}
		}
		out.print(Jlist);
	}

%>