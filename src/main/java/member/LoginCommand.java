package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class LoginCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email") == null?"":request.getParameter("email");
		String password = request.getParameter("password") == null?"":request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe") == null?"":request.getParameter("rememberMe");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = null;
		
		/* --- 회원가입한 이메일인지 확인 --- */
		boolean res = dao.checkValidEmail(email);
		
		if(res==false) {
			request.setAttribute("msg", "failLogin");
			request.setAttribute("url", request.getContextPath()+"/loginBefore.member");
			return;
		}
		
		vo = dao.getUserInformation(email);

		/* --- 비밀번호 비교 --- */
		SecurityUtil security = new SecurityUtil();
		password = security.encryptSHA256(password);
		
		if(!password.equals(vo.getPassword())) {
			request.setAttribute("msg", "failLogin");
			request.setAttribute("url", request.getContextPath()+"/loginBefore.member");
			return;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("sEmail", email);
		session.setAttribute("sGrade", Integer.parseInt(vo.getGrade()));
		
		Cookie cookieEmail = new Cookie("cEmail", email);
		
		if(rememberMe.equals("true")) {
			cookieEmail.setMaxAge(60*60*24*7);
		}
		else {
			cookieEmail.setMaxAge(0);
		}
		
		response.addCookie(cookieEmail);
		request.setAttribute("msg", "successLogin");
		request.setAttribute("url", request.getContextPath()+"/");
	}
}
