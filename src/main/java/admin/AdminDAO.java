package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.AuthorProfileVO;
import book.BookVO;
import conn.GetConn;

public class AdminDAO {
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
	public JSONObject getAuthorInfoByName(String author) {
		JSONObject finalObject = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		try {
			sql = "SELECT * FROM j_author_profile "
					+ "WHERE name_author like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+author+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HashMap<String, Object> hashMap = new HashMap<String, Object>();

		        AuthorProfileVO vo = new AuthorProfileVO();
		        
		        vo.setIdx(rs.getInt("idx"));
				vo.setNameAuthor(rs.getString("name_author"));
				vo.setRole(rs.getString("role"));
				vo.setNationality(rs.getString("nationality"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAwards(rs.getString("awards"));
				vo.setEducation(rs.getString("education"));
				vo.setIntroduceText(rs.getString("introduce_text"));
				/*키, 값*/
				hashMap.put("idx", vo.getIdx());
				hashMap.put("nameAuthor", vo.getNameAuthor());
				hashMap.put("role", vo.getRole());
				hashMap.put("nationality", vo.getNationality());
				hashMap.put("birthday", vo.getBirthday());
				hashMap.put("awards", vo.getAwards());
				hashMap.put("education", vo.getEducation());
				hashMap.put("introduceText", vo.getIntroduceText());
				/*{키:값, 키:값, 키:값...} 형식으로 저장*/
				JSONObject jsonObject = new JSONObject(hashMap);
				/*위에서 저장된 파일들을 배열에 저장 [{키:값, 키:값..}, {키:값,....}] 형식으로 저장*/
				jsonArr.add(jsonObject);
			}
			/*위에서 저장된 배열에 키값을 부여*/
			finalObject.put("author", jsonArr);
		} catch (SQLException e) {
			System.out.println("getAuthorInfo "+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return finalObject;
	}

	public JSONObject getAuthorInfoByIdx(int idx) {
		JSONObject finalObject = new JSONObject();
        JSONArray jsonArr = new JSONArray();
		try {
			sql = "SELECT * FROM j_author_profile "
					+ "WHERE idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HashMap<String, Object> hashMap = new HashMap<String, Object>();

		        AuthorProfileVO vo = new AuthorProfileVO();
		        
		        vo.setIdx(rs.getInt("idx"));
				vo.setNameAuthor(rs.getString("name_author"));
				vo.setRole(rs.getString("role"));
				vo.setNationality(rs.getString("nationality"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAwards(rs.getString("awards"));
				vo.setEducation(rs.getString("education"));
				vo.setIntroduceText(rs.getString("introduce_text"));
				/*키, 값*/
				hashMap.put("idx", vo.getIdx());
				hashMap.put("nameAuthor", vo.getNameAuthor());
				hashMap.put("role", vo.getRole());
				hashMap.put("nationality", vo.getNationality());
				hashMap.put("birthday", vo.getBirthday());
				hashMap.put("awards", vo.getAwards());
				hashMap.put("education", vo.getEducation());
				hashMap.put("introduceText", vo.getIntroduceText());
				/*{키:값, 키:값, 키:값...} 형식으로 저장*/
				JSONObject jsonObject = new JSONObject(hashMap);
				/*위에서 저장된 파일들을 배열에 저장 [{키:값, 키:값..}, {키:값,....}] 형식으로 저장*/
				jsonArr.add(jsonObject);
			}
			/*위에서 저장된 배열에 키값을 부여*/
			finalObject.put("author", jsonArr);
		} catch (SQLException e) {
			System.out.println("getAuthorInfo "+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return finalObject;
	}

	public String setBookInfo(BookVO bookVo) {
		String res = "0";
		try {
			sql="INSERT INTO j_book "
					+ "VALUES(DEFAULT, ?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookVo.getTitle());
			pstmt.setString(2, bookVo.getPublisher());
			pstmt.setString(3, bookVo.getDatePublishing());
			pstmt.setString(4, bookVo.getIsbn());
			pstmt.setString(5, bookVo.getTextContent());
			pstmt.setString(6, bookVo.getCategorySub());
			pstmt.setString(7, bookVo.getImgSaved());
			pstmt.setString(8, bookVo.getCategoryMain());
			pstmt.setString(9, bookVo.getCategoryNation());
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("setBookInfo"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public String getIdxBook(String isbn) {
		String idx = "";
		try {
			sql = "SELECT idx "
					+ "FROM j_book "
					+ "WHERE isbn = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = rs.getString("idx");
			}
		} catch (SQLException e) {
			System.out.println("getIdxBook"+sql);
			System.out.println(e.getMessage());
		}
		return idx;
	}

	public String setBookAuthorInfo(String idxBook, String[] idxAuthorArr) {
		String res = "0";
		try {
			sql="INSERT INTO j_book_author "
					+ "VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<idxAuthorArr.length; i++) {
				pstmt.setString(1, (""+i));
				pstmt.setString(2, idxAuthorArr[i]);
				pstmt.setString(3, idxBook);
				pstmt.executeUpdate();
			}
			res="1";
		} catch (SQLException e) {
			System.out.println("setBookInfo"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}
}
