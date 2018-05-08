package gust;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import db.DBClose;
import db.DBOpen;


public class gustDAO {
	
	public boolean compareId(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = (String) map.get("id");
		int num = (Integer) map.get("num");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from gust ");
		sql.append(" where id=? and num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			
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
	
	public int total2() {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from gust ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from gust ");
		if(word.trim().length()>0) {
			sql.append(" where "+col+" like '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0) {				
				pstmt.setString(++i, word);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	public List<gustDTO> list(Map map) {
		List<gustDTO> list = new ArrayList<gustDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id, content, num, wdate, r ");
		sql.append(" from( ");
		sql.append(" 	select id, content, num, wdate, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select id, content, num, to_char(wdate, 'yyyy-mm-dd') wdate ");
		sql.append(" 		from gust ");
		if(word.trim().length()>0) {			
			sql.append(" 	where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 		order by num desc ");
		sql.append(" 	) ");
		sql.append(" ) ");
		sql.append(" where r>=? and r<=? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				gustDTO dto = new gustDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
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
	
	public List<gustDTO> Jlist(Map map) {
		List<gustDTO> list = new ArrayList<gustDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select id, content, num, wdate, r ");
		sql.append(" from( ");
		sql.append(" 	select id, content, num, wdate, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select id, content, num, to_char(wdate, 'yyyy-mm-dd') wdate ");
		sql.append(" 		from gust ");
		if(word.trim().length()>0) {			
			sql.append(" 	where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 		order by num ");
		sql.append(" 	) ");
		sql.append(" ) ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				gustDTO dto = new gustDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
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
	
	public boolean create(gustDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into gust(num, id, content, wdate) ");
		sql.append(" values((select (nvl(max(num),0)+1) as num from gust) ");
		sql.append(" ,?,?,sysdate ");
		sql.append(" ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getContent());
			
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
	
	public gustDTO read(int num) {
		gustDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, id, content, wdate ");
		sql.append(" from gust ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new gustDTO();
				
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
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
	
	public boolean update(gustDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update gust ");
		sql.append(" set content=? ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			
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
		sql.append(" delete gust ");
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
	
	
}
