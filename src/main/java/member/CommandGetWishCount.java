package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandGetWishCount implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = session.getAttribute("sEmail") == null ? "없음" : ""+session.getAttribute("sEmail");
		
		if(email.equals("없음")) {
			return;
		}
		
		MemberVO vo = dao.getUserInformation(email);
		
		int idx = vo.getIdx();
		
		int res = dao.getWishlistCount(idx);
		
		String strRes = res+"";

		response.getWriter().write(strRes);
	}
}