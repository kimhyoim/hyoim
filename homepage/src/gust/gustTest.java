package gust;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class gustTest {
	
	public static void main(String[] args) {
		gustDAO dao = new gustDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		list(dao);
	}

	private static void list(gustDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "id");
		map.put("word", "");
		
		List<gustDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			gustDTO dto = list.get(i);
			p(dto);
			p("--------------------");
		}
		
	}

	private static void update(gustDAO dao) {
		// TODO Auto-generated method stub
		int num = 1;
		gustDTO dto = dao.read(num);
		
		String content = "하이루";
		dto.setContent(content);
		
		boolean flag = dao.update(dto);
		
		if(flag) {
			p("업데이트 성공");
		} else {
			p("업데이트 실패");
		}
		
	}

	private static void read(gustDAO dao) {
		// TODO Auto-generated method stub
		int num = 1;
		
		gustDTO dto = dao.read(num);
		
		p(dto);
	}

	private static void p(gustDTO dto) {
		p("작성자 : "+dto.getId());
		p("내용 : "+dto.getContent());
		p("작성일 : "+dto.getWdate());
		p("번호 : "+dto.getNum());
	}

	private static void create(gustDAO dao) {
		String id = "user1";
		String content = "하이";
		
		gustDTO dto = new gustDTO();
		dto.setId(id);
		dto.setContent(content);
		
		boolean flag = dao.create(dto);
		
		if(flag) {
			p("생성 성공");
		} else {
			p("생성 실패");
		}
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
