package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandLeaveOk implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reason = request.getParameter("reason");
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		
		/* 세션으로 정보 불러옴 */
		MemberDAO dao = new MemberDAO();
		MemberVO vo =dao.getUserInformation(email);
		
		if(vo==null) {
			request.setAttribute("msg", "failLeave");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		
		int idxUser = vo.getIdx();
		boolean delRes = dao.deleteAccount(idxUser);
		
		if(delRes == false) {
			request.setAttribute("msg", "failLeave");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		else {
			dao.setUserWithdrawl(email, reason);
		}
		
		session.invalidate();

		request.setAttribute("msg", "successLeave");
		request.setAttribute("url", request.getContextPath()+"/");
	}
}