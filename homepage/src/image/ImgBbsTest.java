package image;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import image.ImgBbsDTO;

public class ImgBbsTest {
	
	public static void main(String[] args) {
		ImgBbsDAO dao = new ImgBbsDAO();
		
		//list(dao);
		//create(dao);
		//pwCheck(dao);
		//imgRead(dao);
		upViewcnt(dao);
	}

	private static void upViewcnt(ImgBbsDAO dao) {
		// TODO Auto-generated method stub
		int num = 7;
		
		for(int i=0; i<10; i++) {
			dao.upViewcnt(num);
		}
		
		ImgBbsDTO dto = dao.read(num);
		
		p("조회수 : "+ dto.getViewcnt());
	}

	private static void imgRead(ImgBbsDAO dao) {
		// TODO Auto-generated method stub
		int num = 2;
		List list = new ArrayList();
		list = dao.imgRead(num);
		
		String[] files = (String[]) list.get(0);
		int[] noArr = (int[]) list.get(1);
		
		for(int j=0; j<files.length; j++) {
			p(files[j]);
		}
		for(int i=0; i<noArr.length; i++) {
			p(noArr[i]);
		}
		
	}

	private static void pwCheck(ImgBbsDAO dao) {
		// TODO Auto-generated method stub
		int num = 1;
		String pw = "1234";
		
		Map map = new HashMap();
		map.put("num", num);
		map.put("pw", pw);
		
		boolean flag = dao.pwCheck(map);
		
		if(flag) {
			p("비밀번호 일치");
		} else {
			p("비밀번호 다름");
		}
		
	}

	private static void create(ImgBbsDAO dao) {
		// TODO Auto-generated method stub
		ImgBbsDTO dto = new ImgBbsDTO();
		dto.setId("user1");
		dto.setMname("토르");
		dto.setTitle("묠니르");
		dto.setContent("부셔지기 전 묠니르");
		dto.setPw("1234");
		dto.setFname("묠니르.jpg");
		dto.setFilesize(0);
		
		boolean flag = dao.create(dto);
		
		if(flag) {
			p("성공");
		} else {
			p("실패");
		}
		
	}

	private static void list(ImgBbsDAO dao) {
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<ImgBbsDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			ImgBbsDTO dto = list.get(i);
			p(dto);
			p("--------------------------");
		}
		
	}
	private static void p(ImgBbsDTO dto) {
		// TODO Auto-generated method stub
		p("번호:"+dto.getNum());
		p("이름:"+dto.getMname());
		p("제목:"+dto.getTitle());
		p("파일명:"+dto.getFname());
		p("작성일:"+dto.getWdate());
		
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}
	private static void p(int cnt) {
		// TODO Auto-generated method stub
		System.out.println(cnt);
	}

}
