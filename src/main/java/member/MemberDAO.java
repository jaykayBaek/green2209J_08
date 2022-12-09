package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;
	
	/* --- 이메일 중복 체크 ---*/
	public MemberVO checkValidEmail(String email, MemberVO vo) {
		try {
			sql = "SELECT "
					+ "email, enabled, date_deleted, TIMESTAMPDIFF(DAY, date_deleted, NOW()) date_deleted_diff "
				+ "FROM j_user "
				+ "WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setEmail(rs.getString("email"));
				vo.setEnabled(rs.getInt("enabled"));
				vo.setDateDeleted(rs.getString("date_deleted"));
				vo.setDateDeletedDiff(rs.getInt("date_deleted_diff"));
			}
			else {
				return vo;
			}
			
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	/* --- 회원가입 스탭 1. j_user에 기초 정보 기입 ---*/
	public boolean register(MemberVO vo) {
		boolean res = false;
		try {
			sql = "INSERT INTO j_user "
					+ "VALUES(DEFAULT, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT, ?, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getLastUpdatedIp());
			rs = pstmt.executeQuery();
			res = true;
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public int bringUserIdx(String email) {
		int idx = 0;
		
		try {
			sql = "SELECT idx"
				+ " FROM j_user "
				+ " WHERE email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			idx = rs.getInt("idx");
			
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return idx;
	}

	public boolean inputUserInfo(int idxUser) {
		boolean res = false;
		try {
			sql = "INSERT INTO j_user_info "
					+ "VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idxUser);
			pstmt.setString(2, vo.getNameUser());
			pstmt.setString(3, vo.getBirthYear());
			pstmt.setString(4, vo.getPhoneNo());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getJob());
			pstmt.setString(7, vo.getAddress());
			rs = pstmt.executeQuery();
			res = true;
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : " + sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

}
