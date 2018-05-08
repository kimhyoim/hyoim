package itinerary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ItinDAO {
	
	public List<ItinDTO> list(Map map) {
		List<ItinDTO> list = new ArrayList<ItinDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, site, period, id, r ");
		sql.append(" from( ");
		sql.append(" 	select num, site, period, id, rownum as r ");
		sql.append(" 	from ( ");
		sql.append(" 		select num, site, period, id ");
		sql.append(" 		from itin ");
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
				ItinDTO dto = new ItinDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setPeriod(rs.getString("period"));
				dto.setSite(rs.getString("site"));
				
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
	
	public ItinDTO read(int num) {
		ItinDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, id, site, period, content, lat, lng ");
		sql.append(" from itin ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ItinDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));				
				dto.setContent(rs.getString("content"));
				dto.setPeriod(rs.getString("period"));
				dto.setSite(rs.getString("site"));
				dto.setLat(rs.getDouble("lat"));
				dto.setLat(rs.getDouble("lng"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	public boolean create(ItinDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into itin(num, id, site, period, content, wdate) ");
		sql.append(" values((select (nvl(max(num),0)+1) as num from itin) ");
		sql.append(" ,?,?,?,?,sysdate) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSite());
			pstmt.setString(3, dto.getPeriod());
			pstmt.setString(4, dto.getContent());
			
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
	
	public boolean update(ItinDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update itin ");
		sql.append(" set site=?, period=?, content=? ");
		sql.append(" where num=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSite());
			pstmt.setString(2, dto.getPeriod());
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
		sql.append(" delete from itin ");
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
		}
		
		return flag;
	}
	
	public int total(Map map) {//col, word
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from itin ");
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
	
	public void upViewcnt(int num) {
		
	}
	
	public boolean idCheck(Map map) {
		boolean flag = false;
		
		return flag;
	}

}
