package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;
	MemberWithdrawalVO voWithdrawal = null;
	
	/*--- 탈퇴한 이력이 있는지 체킹 ---*/
	public int checkHistoryWithrawal(String email) {
		int res = 32;
		try {
			sql = "SELECT "
					+ "idx, email_user, date_deleted, TIMESTAMPDIFF(DAY, date_deleted, NOW()) date_deleted_diff "
				+ "FROM j_user_withdrawal "
				+ "WHERE email_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt("date_deleted_diff");
			}
		} catch (SQLException e) {
			System.out.println("checkHistoryWithrawal e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
	}
	
	/* --- 중복된 이메일이 있는지 확인 --- */
	public boolean checkValidEmail(String email) {
		boolean res = false;
		try {
			sql = "SELECT "
					+ "email "
				+ "FROM j_user "
				+ "WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = true;
			}
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
		
	}

	public boolean register(MemberVO vo) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO j_user "
					+ "VALUES(DEFAULT, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getLastUpdatedIp());
			pstmt.setString(4, vo.getNameUser());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getBirthYear());
			pstmt.setString(7, vo.getPhoneNo());
			pstmt.setString(8, vo.getGender());
			pstmt.setString(9, vo.getJob());
			pstmt.executeUpdate();
			res=true;
		} catch (SQLException e) {
			System.out.println("register e : " + sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	/* 로그인 시 유저 정보 가져옴 */
	public MemberVO getUserInformation(String email) {
		vo = new MemberVO();
		try {
			sql = "SELECT * FROM j_user WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setEmail(rs.getString("email"));
				vo.setPassword(rs.getString("password"));
				vo.setGrade(rs.getString("grade"));
				vo.setPoint(rs.getString("point"));
				vo.setDateCreated(rs.getString("date_created"));
				vo.setDateVisited(rs.getString("date_visited"));
				vo.setLastUpdatedIp(rs.getString("last_updated_ip"));
				vo.setNameUser(rs.getString("name_user"));
				vo.setAddress(rs.getString("address"));
				vo.setBirthYear(rs.getString("birthyear"));
				vo.setPhoneNo(rs.getString("phone_no"));
				vo.setGender(rs.getString("gender"));
				vo.setJob(rs.getString("job"));
			}
			else {
				vo = null;
			}
			
		} catch (SQLException e) {
			System.out.println("getUserInformation e : " + sql);
			System.out.println(e.getMessage());
		}
		return vo;
	}

	public String findForgetEmail(String name, String phoneNo) {
		String email = "";
		try {
			sql = "SELECT email"
					+ " FROM j_user"
					+ " WHERE name_user=? AND phone_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phoneNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString("email");
			}
		}
		catch (SQLException e) {
			System.out.println(sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return email;
	}

	public boolean hasPassword(String email, String phoneNo) {
		boolean res = false;
		try {
			sql = "SELECT password"
					+ " FROM j_user"
					+ " WHERE email=? AND phone_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, phoneNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = true;
			}
		}
		catch (SQLException e) {
			System.out.println(sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
	}

	/*--- 임시 비밀번호 수정 ---*/
	public boolean updatePassword(String pwdParsed, String email) {
		boolean res = false;
		try {
			sql = "UPDATE j_user"
					+ " SET password=?"
					+ " WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwdParsed);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println(sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
	/*--- 장바구니 추가하기 ---*/
	public boolean addWishList(int idxProduct, int idxUser) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO j_wishlist (idx, idx_product, idx_user) "
					+ "VALUES (DEFAULT, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProduct);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
			
		} catch (SQLException e) {
			System.out.println("addWishList"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	/*--- 장바구니 지우기 ---*/
	public boolean removeWishlist(String idxProduct, int idxUser) {
		boolean res = false;
		
		try {
			sql = "DELETE FROM j_wishlist "
					+ "WHERE idx_user=? AND idx_product IN ("+idxProduct+")";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			
			pstmt.executeUpdate();
			res = true;
			
		} catch (SQLException e) {
			System.out.println("removeWishlist"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	/*---  ---*/
	/*--- 장바구니 가져오기 ---*/
	public ArrayList<WishlistVO> getWishlist(int idxUser) {
		ArrayList<WishlistVO> vos = new ArrayList<>();
		try {
			sql = "SELECT b.idx idxBook, p.idx idxProduct, "
					+ "b.title, p.price_ebook, p.rate_discount, b.isbn, name_author, b.img_saved "
					+ "FROM j_wishlist w "
					+ "	JOIN j_product p ON p.idx = w.idx_product "
					+ "	JOIN j_book b ON b.idx = p.idx_book "
					+ "	JOIN j_book_author ba ON ba.idx_book = b.idx "
					+ " JOIN j_author_profile ap ON ap.idx=ba.idx_author and ba.author_ordinal = 0 and ap.role = '작가' "
					+ "WHERE idx_user=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WishlistVO vo = new WishlistVO();
				vo.setIdxBook(rs.getInt("idxBook"));
				vo.setIdxProduct(rs.getInt("idxProduct"));
				vo.setTitle(rs.getString("b.title"));
				vo.setPriceEbook(rs.getString("p.price_ebook"));
				vo.setRateDiscount(rs.getString("p.rate_discount"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setNameAuthor(rs.getString("name_author"));
				vo.setImgSaved(rs.getString("b.img_saved"));
				vo.setPriceCalculated((int)(Integer.parseInt(vo.getPriceEbook()) * (1 - (Integer.parseInt(vo.getRateDiscount())) * 0.01)));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getWishlist"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int getWishlistCount(int idx) {
		int res=0;
		
		try {
			sql = "SELECT COUNT(idx_user) count "
					+ "FROM j_wishlist "
					+ "WHERE idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt("count");
			}
			
		} catch (SQLException e) {
			System.out.println("getWishlistCount"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public ArrayList<CheckoutVO> getCheckout(String idxProduct) {
		ArrayList<CheckoutVO> vos = new ArrayList<>();
		try {
			sql = "SELECT b.img_saved, p.idx, b.idx, p.price_ebook, p.rate_discount, b.title, ap.name_author, b.isbn "
					+ "FROM j_product p "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "JOIN j_book_author ba ON ba.idx_book = b.idx "
					+ "JOIN j_author_profile ap ON ap.idx = ba.idx_author and ba.author_ordinal = 0 "
					+ "WHERE p.idx IN("+idxProduct+")";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CheckoutVO vo = new CheckoutVO();
				
				vo.setImgSaved(rs.getString("b.img_saved"));
				vo.setIdxProduct(rs.getInt("p.idx"));
				vo.setIdxBook(rs.getInt("b.idx"));
				vo.setPriceEbook(rs.getString("p.price_ebook"));
				vo.setRateDiscount(rs.getString("p.rate_discount"));
				vo.setTitleBook(rs.getString("b.title"));
				vo.setNameAuthor(rs.getString("ap.name_author"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setPriceCalculated((int)(Integer.parseInt(vo.getPriceEbook()) * (1 - (Integer.parseInt(vo.getRateDiscount())) * 0.01)));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getCheckout"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	public String getDatePurchased() {
		String res = "";
		try {
			sql = "SELECT order_no "
					+ "FROM j_order_list "
					+ "WHERE date_purchased > CURDATE() "
					+ "ORDER BY order_no desc "
					+ "LIMIT 1;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getString("order_no");
			}
			
		} catch (SQLException e) {
			System.out.println("getDatePurchased"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public boolean setOrderList(OrderListVO listVO) {
		boolean res = false;
		try {
			sql = "INSERT INTO j_order_list "
					+ "VALUES(DEFAULT,?,?,?,?,?,?,?,?,DEFAULT,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, listVO.getIdxUser());
			pstmt.setString(2, listVO.getOrderNo());
			pstmt.setInt(3, listVO.getPriceOrder());
			pstmt.setInt(4, listVO.getPriceSales());
			pstmt.setInt(5, listVO.getPricePointUsed());
			pstmt.setInt(6, listVO.getPricePayment());
			pstmt.setString(7, listVO.getOptionChoosed());
			pstmt.setInt(8, listVO.getPointEarned());
			pstmt.setString(9, listVO.getBirthYear());
			pstmt.setString(10, listVO.getPhoneNo());
			pstmt.setString(11, listVO.getGender());
			pstmt.setString(12, listVO.getJob());
			
			pstmt.executeUpdate();
			
			res = true;
			
		} catch (SQLException e) {
			System.out.println("setOrderList e : " + sql);
			System.out.println(e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<String> getBookIdx(String productIdx, int idx) {
		ArrayList<String> arr = new ArrayList<>();
		
		try {
			sql = "SELECT b.idx bookIdx FROM j_product p "
					+ "JOIN j_book b ON b.idx =  p.idx_book "
					+ "WHERE p.idx in ("+productIdx+")";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				arr.add(rs.getString("bookIdx"));
			}
			
		} catch (SQLException e) {
			System.out.println("getIdxProduct"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return arr;
	}

	public boolean setMyLib(ArrayList<String> bookIdx, int idxUser) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO "
					+ "j_mylib (idx, idx_book, idx_user) VALUES ";
			
			for(int i=0; i<bookIdx.size(); i++) {
				sql += "(DEFAULT,"+bookIdx.get(i)+","+idxUser+"),";
			}
			sql = sql.substring(0,sql.lastIndexOf(","));
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			res = true;
			
		} catch (Exception e) {
			System.out.println("setMyLib"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean addPoint(int pointEarned, int idxUser) {
		boolean res = false;
		
		try {
			sql = "UPDATE j_user SET point=point+? WHERE idx = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pointEarned);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
			
		} catch (Exception e) {
			System.out.println("addPoint"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean subtractPoint(int pointEarned, int idxUser) {
		boolean res = false;
		
		try {
			sql = "UPDATE j_user SET point=point-? WHERE idx = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pointEarned);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
			
		} catch (Exception e) {
			System.out.println("addPoint"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int getOrderListIdx(int idxOrderList) {
		int res = 0;
		try {
			sql = "SELECT idx FROM j_order_list "
					+ "WHERE idx_user = ? "
					+ "ORDER BY idx DESC "
					+ "LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxOrderList);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt("idx");
			}
			
		} catch (SQLException e) {
			System.out.println("setOrderListBook"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public boolean setOrderListBook(int idxOrderList, String[] productIdxArr) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO "
					+ "j_order_book_info (idx, idx_order_list, idx_product) VALUES ";
			
			for(int i=0; i<productIdxArr.length; i++) {
				sql += "(DEFAULT,"+idxOrderList+","+productIdxArr[i]+"),";
			}
			sql = sql.substring(0,sql.lastIndexOf(","));
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			res = true;
			
		} catch (SQLException e) {
			System.out.println("setMyLib"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int getTotalPaymentRecord(int idxUser) {
		int res = 0;
		try {
			sql = "SELECT count(idx_user) cnt FROM j_order_list WHERE idx_user = 1";
			
			sql = sql.substring(0,sql.lastIndexOf(","));
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			System.out.println("setMyLib"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public ArrayList<MyPaymentVO> getOrderList(int idxUser) {
		ArrayList<MyPaymentVO> vos = new ArrayList<>();
		try {
			sql = "SELECT idx, idx_user, order_no, price_order, price_sales, price_point_used, "
					+ "price_payment, option_choosed, point_earned, date_purchased "
					+ "FROM j_order_list "
					+ "WHERE idx_user = ? "
					+ "ORDER BY date_purchased DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MyPaymentVO vo = new MyPaymentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setIdxUser(rs.getInt("idx_user"));
				vo.setOrderNo(rs.getString("order_no"));
				vo.setPriceOrder(rs.getInt("price_order"));
				vo.setPriceSales(rs.getInt("price_sales"));
				vo.setPricePointUsed(rs.getInt("price_point_used"));
				vo.setPricePayment(rs.getInt("price_payment"));
				vo.setOptionChoosed(rs.getString("option_choosed"));
				vo.setPointEarned(rs.getInt("point_earned"));
				vo.setDatePurchased(rs.getString("date_purchased"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getOrderList"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			
		}
		return vos;
	}

	public MyPaymentVO getOrderListDetail(int idxUser, String orderNo) {
		MyPaymentVO vo = new MyPaymentVO();
		try {
			sql = "SELECT * FROM "
					+ "j_order_list ol "
					+ "WHERE order_no = ? AND idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			pstmt.setInt(2, idxUser);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setIdxUser(rs.getInt("idx_user"));
				vo.setOrderNo(rs.getString("order_no"));
				vo.setPriceOrder(rs.getInt("price_order"));
				vo.setPriceSales(rs.getInt("price_sales"));
				vo.setPricePointUsed(rs.getInt("price_point_used"));
				vo.setPricePayment(rs.getInt("price_payment"));
				vo.setOptionChoosed(rs.getString("option_choosed"));
				vo.setPointEarned(rs.getInt("point_earned"));
				vo.setDatePurchased(rs.getString("date_purchased"));
			}
		} catch (SQLException e) {
			System.out.println("getOrderList"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vo;
		
	}

	public ArrayList<OrderListBookVO> getOrderListDetailBook(String orderNo, int idxUser) {
		ArrayList<OrderListBookVO> vos = new ArrayList<>();
		try {
			sql = "SELECT b.title, b.isbn, p.idx idxProduct, ol.idx idxOrderList, obi.idx "
					+ "FROM j_order_book_info obi "
					+ "JOIN j_product p ON p.idx = obi.idx_product "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "JOIN j_order_list ol ON ol.idx = obi.idx_order_list "
					+ "WHERE ORDER_NO =  ? ANd idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			pstmt.setInt(2, idxUser);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderListBookVO vo = new OrderListBookVO();
				vo.setIdx(rs.getInt("obi.idx"));
				vo.setIdxOrderList(rs.getInt("idxOrderList"));
				vo.setIdxProduct(rs.getInt("p.idxProduct"));
				vo.setIsbn(rs.getString("b.isbn"));
				vo.setTitle(rs.getString("b.title"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getOrderListDetailBook"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ArrayList<MyLibVO> getMyLibList(int idxUser) {
		ArrayList<MyLibVO> vos = new ArrayList<>();
		
		try {
			sql = "SELECT ps.title_series, ps.isbn_series, ps.idx, ml.idx, ps.img_saved, count(ps.isbn_series) cnt "
					+ "FROM j_mylib ml "
					+ "JOIN j_book b ON b.idx = ml.idx_book "
					+ "JOIN j_product p ON p.idx_book = b.idx "
					+ "JOIN j_product_series ps ON ps.idx = p.idx_series "
					+ "JOIN j_user u ON u.idx = ml.idx_user "
					+ "WHERE u.idx =? "
					+ "GROUP BY title_series";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyLibVO vo = new MyLibVO();
				vo.setIdxMylib(rs.getInt("ml.idx"));
				vo.setIdxSeries(rs.getInt("ps.idx"));
				vo.setImgSavedSeires(rs.getString("ps.img_saved"));
				vo.setIsbnSeries(rs.getString("ps.isbn_series"));
				vo.setTitleSeries(rs.getString("ps.title_series"));
				vo.setBookCntInSeries(rs.getInt("cnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getMyLibList"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
		
	}

	public int getMyBookCount(int idxUser) {
		int res=0;
		
		try {
			sql = "SELECT count(idx_book) count FROM j_mylib "
					+ "WHERE idx_user=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt("count");
			}
		} catch (SQLException e) {
			System.out.println("getMyBookCount"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public ArrayList<MyBookVO> getBuyedBookInSeries(int idxProductSeries, int idxUser) {
		ArrayList<MyBookVO> vos = new ArrayList<>();
		
		try {
			sql = "SELECT b.title, b.img_saved, b.isbn, b.text_content "
					+ "FROM j_order_book_info obi "
					+ "JOIN j_order_list ol ON ol.idx=obi.idx_order_list "
					+ "JOIN j_product p ON obi.idx_product = p.idx "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "WHERE idx_series = ? AND idx_user = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProductSeries);
			pstmt.setInt(2, idxUser);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyBookVO vo = new MyBookVO();
				vo.setTitleBook(rs.getString("b.title"));
				vo.setImgSaved(rs.getString("b.img_saved"));
				vo.setIsbnBook(rs.getString("b.isbn"));
				vo.setTextContent(rs.getString("b.text_content"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("getBuyedBookInSeries"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	/*--- 리뷰 작성했는지 ---*/
	public boolean getReview(int idxUser, int idxProduct) {
		boolean res = false;
		try {
			sql = "SELECT idx_user "
					+ "FROM j_book_review "
					+ "WHERE idx_product = ? AND idx_user = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxProduct);
			pstmt.setInt(2, idxUser);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = true;
			}
			else {
				res = false;
			}
		} catch (SQLException e) {
			System.out.println("getBuyedBookInSeries"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	public boolean getResIsBuyer(int idxUser, int idxBook) {
		boolean res = false;
		
		try {
			sql = "SELECT idx_book "
					+ "FROM j_mylib "
					+ "WHERE idx_user = ? AND idx_book = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			pstmt.setInt(2, idxBook);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = true;
			}
			else {
				res = false;
			}
			
		} catch (Exception e) {
			System.out.println("getResIsBuyer"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return res;
	}

	/* --- 리뷰 작성 --- */
	public boolean setReview(ReviewVO vo) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO j_book_review "
					+ "VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT, ?, DEFAULT, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getIdxProduct());
			pstmt.setInt(2, vo.getIdxUser());
			pstmt.setString(3, vo.getContentReview());
			pstmt.setInt(4, vo.getStarRating());
			pstmt.setInt(5, vo.getBuyCheck());
			pstmt.setInt(6, vo.getSpoilerCheck());
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReview"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	/*--- 리뷰 지우기 ---*/
	public boolean deleteReview(int idxReview) {
		boolean res = false;
		
		try {
			sql = "DELETE FROM j_book_review "
					+ "WHERE idx = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("deleteReview"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean setReviewCmt(int idxUser, int idxReview, String contentReply) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO j_book_review_cmt "
					+ "VALUES(DEFAULT, ?, ?, ?, DEFAULT, DEFAULT)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentReply);
			pstmt.setInt(2, idxReview);
			pstmt.setInt(3, idxUser);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReviewCmt"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public ArrayList<ReviewCmtVO> getReviewCmt(int idxReview) {
		ArrayList<ReviewCmtVO> vos = new ArrayList<>();
		try {
			sql = "SELECT rc.idx, rc.idx_book_review idx_review, rc.idx_user, "
					+ "rc.content_reply, rc.date_created, rc.hidden, u.email "
					+ "FROM j_book_review_cmt rc "
					+ "JOIN j_user u ON u.idx = rc.idx_user "
					+ "JOIN j_book_review br ON br.idx = rc.idx_book_review "
					+ "WHERE rc.idx_book_review = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewCmtVO vo = new ReviewCmtVO();
				vo.setIdxCmt(rs.getInt("rc.idx"));
				vo.setIdxReview(rs.getInt("idx_review"));
				vo.setIdxUser(rs.getInt("rc.idx_user"));
				vo.setContentReply(rs.getString("rc.content_reply"));
				vo.setDateCreated(rs.getString("rc.date_created"));
				vo.setHidden(rs.getInt("rc.hidden"));
				vo.setEmail(rs.getString("u.email"));
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("getReviewCmt"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
	}

	public boolean deleteReviewCmt(int idxCmt, int idxUser) {
		boolean res = false;
		
		try {
			sql = "DELETE FROM j_book_review_cmt "
					+ "WHERE idx = ? AND idx_user = ?";
			

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxCmt);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("DeleteReviewCmt"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean getResIsClickedLike(int idxReview, int idxUser) {
		boolean res = false;
		
		try {
			sql = "SELECT idx "
					+ "FROM j_book_review_like "
					+ "WHERE idx_review = ? AND idx_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.setInt(2, idxUser);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = true;
			}
		} catch (SQLException e) {
			System.out.println("getResIsClickLiked"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
	}

	public boolean setReviewLike(int idxReview, int idxUser) {
		boolean res = false;
		
		try {
			sql = "INSERT INTO j_book_review_like "
					+ "VALUE(DEFAULT, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReviewLike"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean deleteReviewLike(int idxReview, int idxUser) {
		boolean res = false;
		
		try {
			sql = "DELETE FROM j_book_review_like "
					+ "WHERE idx_review = ? AND idx_user = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			pstmt.setInt(2, idxUser);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReviewLike"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean updateJob(String job, String email) {
		boolean res = false;
		
		try {
			sql = "UPDATE j_user "
					+ "SET job = ?"
					+ "WHERE email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReviewLike"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean deleteAccount(int idxUser) {
		boolean res = false;
		
		try {
			sql = "UPDATE j_user "
					+ "SET email='회원탈퇴한 계정', password=null, grade=null, point=null, "
					+ "date_created=null, date_visited = null, last_updated_ip=null, name_user=null,"
					+ "address=null, birthyear=null,phone_no=null, gender=null, job=null "
					+ "WHERE idx = ?";
//			sql = "UPDATE j_user "
//					+ "SET email='회원탈퇴한 계정', password='', grade='', point='', "
//					+ "date_created='', date_visited = '', last_updated_ip='', name_user='',"
//					+ "address='', birthyear='',phone_no='', gender='', job='' "
//					+ "WHERE idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("deleteAccount"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		
		return res;		
	}

	public void setUserWithdrawl(String email, String reason) {
		
		try {
			sql = "INSERT INTO j_user_withdrawal (idx, reason_withdrawal, email_user, date_deleted) "
					+ "VALUES(DEFAULT, ?, ?, DEFAULT)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reason);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setReviewLike"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<ReviewVO> getReviewContent(int idxUser) {
		ArrayList<ReviewVO> vos = new ArrayList<>();
		try {
			sql = "SELECT br.idx, br.idx_product, br.idx_user, b.title, br.content_review, br.star_rating, "
					+ "br.date_created, br.buy_check, br.hidden, br.spoiler_check, b.isbn "
					+ "FROM j_book_review br "
					+ "JOIN j_product p ON p.idx = br.idx_product "
					+ "JOIN j_book b ON b.idx = p.idx_book "
					+ "WHERE idx_user = ? "
					+ "ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
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
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("getReviewContent"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return vos;
		
	}

	public boolean updateReview(int idxReview, String content, int spoilerCheck) {
		boolean res = false;
		try {
			sql = "UPDATE j_book_review "
					+ "SET content_review = ?, spoiler_check = ? "
					+ "WHERE idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, spoilerCheck);
			pstmt.setInt(3, idxReview);
			pstmt.executeUpdate();
			res = true;
		} catch (SQLException e) {
			System.out.println("setReviewLike"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public boolean checkReviewHasCmt(int idxReview) {
		boolean res = false;
		try {
			sql = "SELECT idx "
					+ "FROM j_book_review_cmt "
					+ "WHERE idx_book_review = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxReview);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res = true;
			}
			else {
				res = false;
			}
			
		} catch (SQLException e) {
			System.out.println("getReviewContent"+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return res;
	}
	
	
}