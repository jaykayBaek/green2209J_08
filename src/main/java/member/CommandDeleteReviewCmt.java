package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandDeleteReviewCmt implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxCmt = request.getParameter("idxCmt") == null? 0 : Integer.parseInt(request.getParameter("idxCmt"));
		int idxUser = request.getParameter("idxUser") == null? 0 : Integer.parseInt(request.getParameter("idxUser"));
		String isbn = request.getParameter("isbn") == null ? "" : request.getParameter("isbn");
		HttpSession session = request.getSession();
		String res = "";

		MemberDAO dao = new MemberDAO();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUserGeted = vo.getIdx();
		
		if(idxUser!=idxUserGeted) {
			request.setAttribute("msg", "failDeleteReviewCmt");
			request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
			return;
		}
		
		boolean delRes = dao.deleteReviewCmt(idxCmt, idxUser);
		
		if(delRes == false) {
			request.setAttribute("msg", "failDeleteReviewCmt");
			request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
			return;
		}
		
		request.setAttribute("msg", "successDeleteReviewCmt");
		request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
	}
}