package member;

import java.io.IOException;
import java.security.interfaces.RSAKey;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandCheckHasReviewCmt implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null?0:Integer.parseInt(request.getParameter("idx"));
		String res = "false";
		
		MemberDAO dao = new MemberDAO();
		boolean resCheck = dao.checkReviewHasCmt(idx);
		
		if(resCheck == true) {
			res = "true";
		}
		
		response.getWriter().write(res);
	}
}
