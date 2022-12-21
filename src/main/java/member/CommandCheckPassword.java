package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class CommandCheckPassword implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password") == null ? "" : request.getParameter("password");
		String res = "";
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInformation(email);
		
		String passwordGeted = vo.getPassword();
		
		SecurityUtil security = new SecurityUtil();
		password = security.encryptSHA256(password);
		if(!password.equals(passwordGeted)) {
			res = "fail";
		}
		else {
			res = "success";
		}
		
		response.getWriter().write(res);
		
	}
}