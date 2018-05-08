package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberTest {
	
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		
		//create(dao);
		list(dao);
	}

	private static void list(MemberDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemberDTO> list = dao.list(map);
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void create(MemberDAO dao) {
		// TODO Auto-generated method stub
		String id = "hyoim";
		String passwd = "1234";
		String email = "kimhyoim23@naver.com";
		String tel = "010-4036-6032";
		String grade = "H";
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setEmail(email);
		dto.setGrade(grade);
		dto.setPasswd(passwd);
		dto.setTel(tel);
		
		boolean flag = dao.create(dto);
		
		if(flag) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void p(MemberDTO dto) {
		p("아이디:"+dto.getId());
		p("전화번호:"+dto.getTel());
		p("이메일:"+dto.getEmail());
		
	}
	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

}
