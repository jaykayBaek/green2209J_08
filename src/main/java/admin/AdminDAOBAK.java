package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import book.AuthorProfileVO;
import conn.GetConn;

public class AdminDAOBAK {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";

	/*---작가 등록---*/
	public String setAuthorInfo(String nameAuthor, String role, String nationality, String birthday, String awardHistory, String eduHistory, String introduceTxt) {
		String res = "0";
		try {
			sql = "INSERT INTO j_author_profile "
					+ "VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nameAuthor);
			pstmt.setString(2, role);
			pstmt.setString(3, nationality);
			pstmt.setString(4, birthday);
			pstmt.setString(5, awardHistory);
			pstmt.setString(6, eduHistory);
			pstmt.setString(7, introduceTxt);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("adSetAuthorInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	/*---작가 검색---*/
	public HashMap<String, AuthorProfileVO> getAuthorInfo(String author) {
		HashMap<String, AuthorProfileVO> map = new HashMap<>();
		try {
			sql = "SELECT * FROM j_author_profile "
					+ "WHERE name_author like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+author+"%");
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()) {
				AuthorProfileVO vo = new AuthorProfileVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNameAuthor(rs.getString("name_author"));
				vo.setRole(rs.getString("role"));
				vo.setNationality(rs.getString("nationality"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAwards(rs.getString("awards"));
				vo.setEducation(rs.getString("education"));
				vo.setIntroduceText(rs.getString("introduce_text"));
				i++;
				map.put(Integer.toString(i)+"a", vo);
			}
		} catch (SQLException e) {
			System.out.println("getAuthorInfo "+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return map;
	}
}
