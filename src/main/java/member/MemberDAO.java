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
	public MemberWithdrawalVO checkHistoryWithrawal(String email, MemberWithdrawalVO vo) {
		vo = new MemberWithdrawalVO();
		try {
			sql = "SELECT "
					+ "idx, email_user, date_deleted, TIMESTAMPDIFF(DAY, date_deleted, NOW()) date_deleted_diff "
				+ "FROM j_user_withdrawal "
				+ "WHERE email_user = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberWithdrawalVO();
				vo.setEmailUser(rs.getString("email_user"));
				vo.setDateDeleted(rs.getString("date_deleted"));
				vo.setDateDeleted(rs.getString("date_deleted_diff"));
			}
			else {
				vo = null;
			}
		} catch (SQLException e) {
			System.out.println("checkHistoryWithrawal e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		return voWithdrawal;
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
			System.out.println("addWishList"+sql);
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
			sql = "SELECT b.img_saved, p.idx, p.price_ebook, p.rate_discount, b.title, ap.name_author, b.isbn "
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
				vo.setPriceEbook(rs.getString("p.price_ebook"));
				vo.setRateDiscount(rs.getString("p.rate_discount"));
				vo.setTitleBook(rs.getString("b.title"));
				vo.setNameAuthor(rs.getString("ap.name_author"));
				vo.setIsbn(rs.getString("b.isbn"));
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
	
	

}
