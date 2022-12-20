package bookinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.AuthorProfileVO;
import book.BookAuthorVO;
import book.BookVO;
import book.ProductSeriesVO;
import book.ProductVO;
import conn.GetConn;
import member.ReviewVO;

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

	/*--- 담으려는 물건이 장바구니에 있는지 확인 ---*/
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
			getConn.rsClose();
		}
		
		return res;
	}

	/*--- 책 내용 보기 ---*/
	public BookVO getBookContent(String isbn, int idxUser) {
		BookVO vo = new BookVO();
		try {
			sql = "SELECT b.title, b.text_content "
					+ "FROM j_order_book_info obi "
					+ "JOIN j_order_list ol ON ol.idx=obi.idx_order_list "
					+ "JOIN j_product p ON obi.idx_product = p.idx "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "WHERE b.isbn = ? AND idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setInt(2, idxUser);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setTitle(rs.getString("b.title"));
				vo.setTextContent(rs.getString("b.text_content"));
			}
			
			
		} catch (SQLException e) {
			System.out.println("checkProductInWishlist"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vo;
		
	}

	public int getIdxProductToBookIsbn(String isbn) {
		int idx = 0;
		try {
			sql = "SELECT p.idx productIdx "
					+ "FROM j_book b "
					+ "JOIN j_product p ON p.idx_book=b.idx "
					+ "WHERE b.isbn = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idx = rs.getInt("productIdx");
			}
			
		} catch (SQLException e) {
			System.out.println("getIdxProductToBookIsbn"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return idx;
	}

	public int getTotalRecordReview(int getIdxProduct) {
		int res = 0;
		try {
			sql = "SELECT COUNT(*) totalCnt FROM j_book_review "
					+ "WHERE idx_product = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getIdxProduct);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				res = rs.getInt("totalCnt");
			}
			
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println("getTotalRecordReview"+e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
	}

	public ArrayList<ReviewVO> getReview(int indexNoStartPage, int pageList, int getIdxProduct) {
		ArrayList<ReviewVO> vos = new ArrayList<>();
		try {
			sql = "SELECT br.idx, br.idx_product, br.idx_user, br.content_review, br.star_rating, br.date_created, "
					+ "br.buy_check, br.hidden, br.spoiler_check, u.email, "
						+ "	(SELECT count(idx) "
						+ "	FROM j_book_review_like "
						+ "	WHERE idx_review = br.idx) likeNum, "
						+ "	(SELECT idx_user "
						+ "	FROM j_book_review_like "
						+ " WHERE idx_review = br.idx) idxUserLike "
					+ "FROM j_book_review br "
					+ "JOIN j_user u ON u.idx = br.idx_user "
					+ "WHERE idx_product = ? "
					+ "ORDER BY idx DESC "
					+ "LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getIdxProduct);
			pstmt.setInt(2, indexNoStartPage);
			pstmt.setInt(3, pageList);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setIdx(rs.getInt("br.idx"));
				vo.setIdxProduct(rs.getInt("br.idx_product"));
				vo.setIdxUser(rs.getInt("br.idx_user"));
				vo.setContentReview(rs.getString("br.content_review"));
				vo.setStarRating(rs.getInt("br.star_rating"));
				vo.setBuyCheck(rs.getInt("br.buy_check"));
				vo.setHidden(rs.getInt("br.hidden"));
				vo.setSpoilerCheck(rs.getInt("br.spoiler_check"));
				vo.setEmail(rs.getString("u.email"));
				vo.setLikeNum(rs.getInt("likeNum"));
				vo.setIdxUserLike(rs.getInt("idxUserLike"));
				vos.add(vo);
			}
		}
		catch (SQLException e) {
			System.out.println("getReview"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public ArrayList<SearchVO> getSearchResult(String search, int pageList, int indexNoStartPage) {
		ArrayList<SearchVO> vos = new ArrayList<>();
		try {
			sql = "SELECT p.idx, b.idx, ap.idx, b.img_saved, b.title, b.isbn, ap.name_author, p.text_introduce, "
					+ "	round((SELECT sum(star_rating) / count(star_rating) FROM j_book_review br where br.idx_product = p.idx), 1) starRating, "
					+ "	(SELECT count(idx) FROM j_book_review br where br.idx_product = p.idx) reviewCnt, p.price_ebook "
					+ "FROM j_product p "
					+ "JOIN j_book b on b.idx = p.idx_book "
					+ "join j_book_author ba on ba.idx_book = b.idx "
					+ "join j_author_profile ap on ap.idx = ba.idx_author "
					+ "WHERE ba.author_ordinal = 0 AND b.title like ? "
					+ "ORDER BY p.idx desc "
					+ "LiMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, indexNoStartPage);
			pstmt.setInt(3, pageList);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchVO vo = new SearchVO();
				vo.setIdxProduct(rs.getInt("p.idx"));
				vo.setIdxBook(rs.getInt("b.idx"));
				vo.setIdxAuthor(rs.getInt("ap.idx"));
				vo.setImgSavedBook(rs.getString("b.img_saved"));
				vo.setTitle(rs.getString("b.title"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setNameAuthor(rs.getString("ap.name_author"));
				vo.setTextIntroduce(rs.getString("p.text_introduce"));
				vo.setStarRating(rs.getInt("starRating"));
				vo.setReviewCnt(rs.getInt("reviewCnt"));
				vo.setPriceEbook(rs.getInt("price_ebook"));
				vos.add(vo);
			}
		}
		catch (SQLException e) {
			System.out.println("getSearchResult"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	/* 검색어로 자료 토탈 구하기 */
	public int getTotalRecordSearch(String search) {
		int res = 0;
		
		try {
			sql = "SELECT count(idx) total "
					+ "FROM j_book "
					+ "WHERE title LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt("total");
			}
		}
		catch (SQLException e) {
			System.out.println("getReview"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

}
