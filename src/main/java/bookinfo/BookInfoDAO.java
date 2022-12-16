package bookinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.AuthorProfileVO;
import book.BookAuthorVO;
import book.BookVO;
import book.ProductSeriesVO;
import book.ProductVO;
import conn.GetConn;

public class BookInfoDAO {
	GetConn getConn = GetConn.getInstance();

	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String sql = "";

	AuthorProfileVO apVo = null;
	BookAuthorVO baVo = null;
	BookVO bVo = null;
	ProductVO pVo = null;
	ProductSeriesVO psVo = null;

	/*--- 도서 이미지 클릭 시 정보창으로 이동할 때 정보들 담는 vo ---*/
	public BookInfoVO getAllBookInfo(String isbn) {
		BookInfoVO vo = null;
		try {
			sql = "select b.category_sub, b.category_nation, b.category_main, "
					+ "b.title, b.publisher, b.isbn, b.date_publishing, b.img_saved, "
					+ "p.price_paper, p.price_ebook, p.rate_discount, p.can_reader, p.text_introduce, "
					+ "ps.title_series, ps.img_saved, ps.price_series, "
					+ "b.idx, p.idx, ps.idx "
					+ "from j_book b "
						+ "join j_product p on b.idx=p.idx_book "
						+ "join j_product_series ps on ps.idx = p.idx_series "
					+ "where b.isbn=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new BookInfoVO();
				vo.setCategoryMain(rs.getString("b.category_main"));
				if (vo.getCategoryMain().equals("소설")) {
					vo.setCategoryNation(rs.getString("b.category_nation"));
				} else {
					vo.setCategoryNation("없음");
				}
				vo.setCategorySub(rs.getString("b.category_sub"));
				vo.setTitleBook(rs.getString("b.title"));
				vo.setPublisher(rs.getString("b.publisher"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setImgSavedBook(rs.getString("b.img_saved"));
				vo.setPricePaper(rs.getString("p.price_paper"));
				vo.setPriceEbook(rs.getString("p.price_ebook"));
				vo.setRateDiscount(rs.getString("p.rate_discount"));
				vo.setCanReader(rs.getInt("p.can_reader"));
				vo.setTextIntroduce(rs.getString("p.text_introduce"));
				vo.setTitleSeries(rs.getString("ps.title_series"));
				vo.setImgSavedSeries(rs.getString("ps.img_saved"));
				vo.setIdxBook(rs.getInt("b.idx"));
				vo.setIdxProduct(rs.getInt("p.idx"));
				vo.setIdxProductSeries(rs.getInt("ps.idx"));
				vo.setPriceSeries(rs.getString("ps.price_series"));
				vo.setDatePublishing(rs.getString("b.date_publishing"));
			}

		} catch (SQLException e) {
			System.out.println("getAllBookInfo" + sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vo;
	}

	/*---시리즈 담는 dao---*/
	public ArrayList<SeriesInfoVO> getBookInfoInSeries(int idxProductSeries) {
		ArrayList<SeriesInfoVO> vos = new ArrayList<>();
		try {
			sql = "select b.title, b.publisher, b.date_publishing, b.isbn, ps.title_series, "
					+ "b.img_saved, b.idx, p.idx, ps.idx, ps.isbn_series "
					+ "from j_product p "
						+ "join j_book b on b.idx = p.idx_book "
						+ "join j_product_series ps on ps.idx=p.idx_series "
					+ "where ps.idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProductSeries);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SeriesInfoVO vo = new SeriesInfoVO();
				vo.setTitleBook(rs.getString("b.title"));
				vo.setPublisher(rs.getString("b.publisher"));
				vo.setDatePublishing(rs.getString("b.date_publishing"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setTitleSeries(rs.getString("ps.title_series"));
				vo.setIdxBook(rs.getInt("b.idx"));
				vo.setIdxProduct(rs.getInt("p.idx"));
				vo.setIdxProductSeries(rs.getInt("ps.idx"));
				vo.setImgSavedBook(rs.getString("b.img_saved"));
				vo.setIsbnSeries(rs.getString("ps.isbn_series"));
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("getSeriesInfo" + sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;

	}

	/*--- 작가 정보 ---*/
	public ArrayList<AuthorProfileVO> getAuthorInfo(int idxBook) {
		ArrayList<AuthorProfileVO> vos = new ArrayList<>();
		try {
			sql = "SELECT ap.idx, ap.name_author, ap.role, ap.nationality, ap.birthday, "
					+ "ap.awards, ap.education, ap.introduce_text, ba.author_ordinal " + "FROM j_author_profile ap "
					+ "JOIN j_book_author ba ON ba.idx_author=ap.idx " + "WHERE ba.idx_book = ? "
					+ "ORDER BY ba.author_ordinal";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxBook);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AuthorProfileVO vo = new AuthorProfileVO();
				vo.setIdx(rs.getInt("ap.idx"));
				vo.setNameAuthor(rs.getString("ap.name_author"));
				vo.setRole(rs.getString("ap.role"));
				vo.setNationality(rs.getString("ap.nationality"));
				vo.setBirthday(rs.getString("ap.birthday"));
				vo.setAwards(rs.getString("ap.awards"));
				vo.setEducation(rs.getString("ap.education"));
				vo.setIntroduceText(rs.getString("ap.introduce_text"));
				vo.setAuthorOrdinal(rs.getInt("ba.author_ordinal"));
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("getSeriesInfo" + sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public String checkProductInWishlist(int idxProduct, int idxUser) {
		String res = "0";
		try {
			sql = "SELECT idx FROM j_wishlist "
					+ "WHERE idx_product=? AND idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProduct);
			pstmt.setInt(2, idxUser);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res="1";
			}
			else {
				res="0";
			}
			
		} catch (Exception e) {
			System.out.println("checkProductInWishlist"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			
		}
		
		return res;
	}

}