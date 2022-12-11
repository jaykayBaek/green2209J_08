package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidEmailCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		MemberDAO dao = new MemberDAO();
		boolean res = dao.checkValidEmail(email);
		
		String strRes;
		
		if(res) {
			strRes = "exist";
		}
		else {
			strRes = "none";
		}
		response.getWriter().write(strRes);
	}
}
