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
					+ "JOIN j_book b on p.idx_book = b.idx "
					+ "order by p.idx desc "
					+ "limit 20";
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
	
	
}
