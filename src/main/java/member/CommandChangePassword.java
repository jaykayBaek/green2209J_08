package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class CommandChangePassword implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwdRe = request.getParameter("pwdRe") == null ? "" : request.getParameter("pwdRe");
		String res = "fail";
		
		SecurityUtil security = new SecurityUtil();
		pwdRe = security.encryptSHA256(pwdRe);
		
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInformation(email);
		
		/* --- 세션 없으면 리턴 --- */
		if(vo==null) {
			response.getWriter().write(res);
			return;
		}
		
		int idxUser = vo.getIdx();
		boolean resUpdate = dao.updatePassword(pwdRe, email);
		
		if(resUpdate==false) {
			response.getWriter().write(res);
			return;
		}
		res = "success";
		response.getWriter().write(res);
	}
}