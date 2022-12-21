package view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.BookVO;
import conn.GetConn;

public class ViewDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";

	public ArrayList<NewBookVO> getNewBooks() {
		ArrayList<NewBookVO> newBookVos = new ArrayList<>();
		
		try {
			sql = "SELECT b.idx book_idx, p.idx product_idx, title, publisher, isbn, img_saved "
					+ "FROM j_product p "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "ORDER BY p.idx desc "
					+ "LIMIT 20";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NewBookVO vo = new NewBookVO();
				vo.setBookIdx(rs.getInt("book_idx"));
				vo.setProductIdx(rs.getInt("product_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setIsbn(rs.getString("isbn"));
				vo.setImgSaved(rs.getString("img_saved"));
				newBookVos.add(vo);
			}
		}
		catch (SQLException e) {
			System.out.println("getNewBooks"+sql);
			System.out.println(e.getMessage());
		}
		 finally {
			getConn.rsClose();
		}
		
		
		return newBookVos;
	}

	public ArrayList<HotBookVO> getHotBooks() {
		ArrayList<HotBookVO> hotBookVos = new ArrayList<>();
		
		try {
			sql = "SELECT count(idx_product) cnt,"
					+ "b.idx book_idx, p.idx product_idx, b.title title, b.publisher publisher, b.isbn isbn, b.img_saved img_saved "
					+ "FROM j_order_book_info bi "
					+ "JOIN j_product p ON p.idx=bi.idx_product "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "GROUP BY idx_product "
					+ "ORDER BY cnt desc "
					+ "LIMIT 20";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotBookVO vo = new HotBookVO();
				vo.setBookIdx(rs.getInt("book_idx"));
				vo.setProductIdx(rs.getInt("product_idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setIsbn(rs.getString("isbn"));
				vo.setImgSaved(rs.getString("img_saved"));
				hotBookVos.add(vo);
			}
		}
		catch (SQLException e) {
			System.out.println("getHotBooks"+sql);
			System.out.println(e.getMessage());
		}
		 finally {
			getConn.rsClose();
		}
		
		return hotBookVos;
	}
	
	
}
