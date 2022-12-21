package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.AuthorProfileVO;
import book.BookVO;
import book.ProductSeriesVO;
import book.ProductVO;
import conn.GetConn;
import member.ReviewVO;

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
		finally {
			getConn.rsClose();
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

	public BookVO getBookInfoByIsbn(String isbn) {
		BookVO vo = new BookVO();
		try {
			sql = "SELECT * FROM j_book "
					+ "WHERE isbn = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setDatePublishing(rs.getString("date_publishing"));
				vo.setIsbn(rs.getString("isbn"));
				vo.setTextContent(rs.getString("text_content"));
				vo.setCategorySub(rs.getString("category_sub"));
				vo.setImgSaved(rs.getString("img_saved"));
				vo.setCategoryMain(rs.getString("category_main"));
				vo.setCategoryNation(rs.getString("category_nation"));
			}
		} catch (SQLException e) {
			System.out.println("getBookInfoByIsbn"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public BookVO getBookInfoByIdx(String idxBook) {
		BookVO vo = new BookVO();
		try {
			sql = "SELECT * FROM j_book "
					+ "WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idxBook);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setDatePublishing(rs.getString("date_publishing"));
				vo.setIsbn(rs.getString("isbn"));
				vo.setTextContent(rs.getString("text_content"));
				vo.setCategorySub(rs.getString("category_sub"));
				vo.setImgSaved(rs.getString("img_saved"));
				vo.setCategoryMain(rs.getString("category_main"));
				vo.setCategoryNation(rs.getString("category_nation"));
			}
		} catch (SQLException e) {
			System.out.println("getBookInfoByIsbn"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public String setProductInfo(ProductVO vo) {
		String res = "0";
		try {
			sql="INSERT INTO j_product "
					+ "VALUES(DEFAULT,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getIdxBook());
			pstmt.setInt(2, vo.getIdxSeries());
			pstmt.setString(3, vo.getPricePaper());
			pstmt.setString(4, vo.getPriceEbook());
			pstmt.setString(5, vo.getRateDiscount());
			pstmt.setInt(6, vo.getCanReader());
			pstmt.setString(7, vo.getTextIntroduce());
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("setProductInfo"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public String setSeriesInfo(ProductSeriesVO vo) {
		String res = "0";
		try {
			sql = "INSERT INTO j_product_series "
					+ "VALUES(DEFAULT, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitleSeries());
			pstmt.setString(2, vo.getPriceSeries());
			pstmt.setString(3, vo.getRateDiscount());
			pstmt.setString(4, vo.getIsbnSeries());
			pstmt.setString(5, vo.getImgSaved());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("setSeriesInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ProductSeriesVO>  getSeriesIdxByTitle(String seriesTitle) {
		ArrayList<ProductSeriesVO> vos = new ArrayList<>();
		try {
			sql = "SELECT * "
					+ "FROM j_product_series "
					+ "WHERE title_series like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+seriesTitle+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ProductSeriesVO vo = new ProductSeriesVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitleSeries(rs.getString("title_series"));
				vo.setPriceSeries(rs.getString("price_series"));
				vo.setRateDiscount(rs.getString("rate_discount"));
				vo.setIsbnSeries(rs.getString("isbn_series"));
				vo.setImgSaved(rs.getString("img_saved"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getIdxBook"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	public boolean setHiddenReview(int idxReview) {
		boolean res = false;
		try {
			sql = "UPDATE j_book_review "
					+ "SET hidden = 1 "
					+ "WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setSeriesInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ReviewVO> getManageReview() {
		ArrayList<ReviewVO> vos = new ArrayList<>();
		try {
			sql = "SELECT br.idx, br.idx_product, u.email, br.idx_user, b.title, br.content_review, br.star_rating, "
					+ "br.date_created, br.buy_check, br.hidden, br.spoiler_check, b.isbn "
					+ "FROM j_book_review br "
					+ "JOIN j_product p ON p.idx = br.idx_product "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "JOIN j_user u ON u.idx = br.idx_user "
					+ "WHERE hidden = 1 "
					+ "ORDER BY idx DESC ";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setIdx(rs.getInt("br.idx"));
				vo.setIdxProduct(rs.getInt("br.idx_product"));
				vo.setIdxUser(rs.getInt("br.idx_user"));
				vo.setTitleBook(rs.getString("b.title"));
				vo.setContentReview(rs.getString("br.content_review"));
				vo.setStarRating(rs.getInt("br.star_rating"));
				vo.setDateCreated(rs.getString("br.date_created"));
				vo.setBuyCheck(rs.getInt("br.buy_check"));
				vo.setHidden(rs.getInt("br.hidden"));
				vo.setSpoilerCheck(rs.getInt("br.spoiler_check"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setEmail(rs.getString("u.email"));
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("setSeriesInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public boolean updateHidden(int idxReview) {
		boolean res = false;
		try {
			sql = "UPDATE j_book_review "
					+ "SET hidden = 0 "
					+ "WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setSeriesInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
}
