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
			
			if(rs.next()) {
				vo = new BookInfoVO();
				vo.setCategoryMain(rs.getString("b.category_main"));
				if(vo.getCategoryMain().equals("소설")) {
					vo.setCategoryNation(rs.getString("b.category_nation"));
				}
				else {
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
			System.out.println("getAllBookInfo"+sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	public ArrayList<SeriesInfoVO> getSeriesInfo(int idxProductSeries) {
		ArrayList<SeriesInfoVO> vos = new ArrayList<>();
		try {
			sql = "select b.title, b.publisher, b.date_publishing, b.isbn, ps.title_series, "
					+ "b.img_saved, b.idx, p.idx, ps.idx "
					+ "from j_product p "
					+ "join j_book b on b.idx = p.idx_book "
					+ "join j_product_series ps on ps.idx=p.idx_series "
					+ "where ps.idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProductSeries);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("getSeriesInfo"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return vos;
		
	}
	
}
