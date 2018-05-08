package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ImgBbsDAO {
	
	public void upViewcnt(int num) {
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update imgbbs ");
		sql.append(" set viewcnt = viewcnt+1 ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		
	}
	
	public List imgRead(int num) {
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(num,2)     over (order by num) pre_num2,    ");
		sql.append("          lag(num,1)     over (order by num ) pre_num1,   ");
		sql.append("          num,  ");
		sql.append("          lead(num,1)    over (order by num) nex_num1,    ");
		sql.append("          lead(num,2)    over (order by num) nex_num2,    ");
		sql.append("          lag(fname,2)  over (order by num) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by num) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by num) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by num) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT num, fname   ");
		sql.append("               FROM imgbbs ");
		sql.append("               ORDER BY num DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE num = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int[] noArr = 
					   {
						rs.getInt("pre_num2"),
						rs.getInt("pre_num1"),
						rs.getInt("num"),
						rs.getInt("nex_num1"),
						rs.getInt("nex_num2")
					    };
				String[] files = 
					    {
						rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("fname"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2")
						};
				
				list.add(files);
				list.add(noArr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
				
		return list;
	}
	
	public List<ImgBbsDTO> list(Map map) {//col, word, sno, eno
		List<ImgBbsDTO> list = new ArrayList<ImgBbsDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, title, mname, fname, wdate, r ");
		sql.append(" from( ");
		sql.append(" 	select num, title, mname, fname, wdate, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select num, title, mname, fname, ");
		sql.append(" 		to_char(wdate, 'yyyy-mm-dd') wdate ");
		sql.append(" 		from imgbbs ");
		if(word.trim().length()>0) {
			sql.append(" 	where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 		order by num desc ");
		sql.append(" 	) ");
		sql.append(" ) ");
		sql.append(" where r>=? and r<=? ");
		
		try {
			//nullpointexception 은 null에 .을 찍었을때 나타난다고 봐도 된다.
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImgBbsDTO dto = new ImgBbsDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setMname(rs.getString("mname"));
				dto.setFname(rs.getString("fname"));
				dto.setWdate(rs.getString("wdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	public boolean create(ImgBbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into  ");
		sql.append(" imgbbs(num, id, mname, title, content, ");
		sql.append(" 		pw, wdate, fname, filesize) ");
		sql.append(" values((select (nvl(max(num),0)+1) as num from imgbbs) ");
		sql.append(" 		,?,?,?,?,?,sysdate,?,?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getPw());
			pstmt.setString(6, dto.getFname());
			pstmt.setInt(7, dto.getFilesize());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public ImgBbsDTO read(int num) {
		ImgBbsDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, fname, title, content, id, pw, filesize, mname ");
		sql.append(" from imgbbs ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				dto = new ImgBbsDTO();
				dto.setFname(rs.getString("fname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setFilesize(rs.getInt("filesize"));
				dto.setMname(rs.getString("mname"));
				dto.setNum(rs.getInt("num"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	public boolean update(ImgBbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update imgbbs ");
		sql.append(" set fname=?, title=?, content=? ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean delete(int num) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete ");
		sql.append(" from imgbbs ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public int total(Map map) {//col, word
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;//레코드 갯수를 가져올것이기 때문에.
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from imgbbs ");
		if(word.trim().length()>0) {
			sql.append(" where "+col+" like '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);//as가 없을땐 그냥 순번으로 가져와도 된다. as가 있으면 as 명을 써준다.
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	public boolean pwCheck(Map map) {//num, pw
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = (Integer) map.get("num");
		String pw = (String) map.get("pw");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(num)  ");
		sql.append(" from imgbbs ");
		sql.append(" where num=? and pw=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt>0) {
					flag = true;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return flag;
	}

}
