package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandSetReviewCmt implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idxReview") == null? 0 : Integer.parseInt(request.getParameter("idxReview"));
		String contentReply = request.getParameter("contentReply") == null? "" : request.getParameter("contentReply");
		HttpSession session = request.getSession();
		String res = "";

		MemberDAO dao = new MemberDAO();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		boolean setRes = dao.setReviewCmt(idxUser, idxReview, contentReply);
		
		if(setRes == true) {
			res = "success";
		}
		else {
			res = "fail";
		}
		
		response.getWriter().write(res);
	}
}