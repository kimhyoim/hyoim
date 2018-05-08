package itinerary;

public class ItinTest {
	
	public static void main(String[] args) {
		ItinDAO dao = new ItinDAO();
		read(dao);
	}

	private static void read(ItinDAO dao) {
		int num = 1;
		ItinDTO dto = dao.read(num);
		
		p(dto);
	}

	private static void p(ItinDTO dto) {
		p("여행지 : "+dto.getSite());
		p("작성자 : "+dto.getId());
		p("기간 : "+dto.getPeriod());
		p("위도 : "+dto.getLat());
		p("경도 : "+dto.getLng());
		p("여행일정 : "+dto.getContent());
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
