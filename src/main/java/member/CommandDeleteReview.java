package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandDeleteReview implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idx") == null? 0 : Integer.parseInt(request.getParameter("idx"));
		int idxProduct = request.getParameter("idxProduct") == null? 0 : Integer.parseInt(request.getParameter("idxProduct"));
		HttpSession session = request.getSession();
		String res = "";

		MemberDAO dao = new MemberDAO();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		boolean isWrite = dao.getReview(idxUser, idxProduct);
		
		if(isWrite == false) {
			res = "fail";
			response.getWriter().write(res);
			return;
		}
		
		boolean checkRes = dao.checkReviewHasCmt(idxReview);
		if(checkRes == true) {
			res = "hasCmt";
			response.getWriter().write(res);
			return;
		}
		boolean delRes = dao.deleteReview(idxReview);
		
		if(delRes == true) {
			res = "success";
		}
		
		response.getWriter().write(res);
	}
}