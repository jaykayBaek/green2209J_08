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
	public int checkValidEmail(String email) {
		int result = 0;
		
		try {
			sql = "select email from j_user where email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0;
			}
			else {
				result = 1;
			}
			
		} catch (SQLException e) {
			System.out.println("checkValidEmail e : "+sql);
			System.out.println(e.getMessage());
		}
		finally {
			getConn.rsClose();
		}
		
		return result;
	}
	
}
