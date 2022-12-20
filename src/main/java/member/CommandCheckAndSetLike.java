package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import book.BookVO;

public class CommandCheckAndSetLike implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idxReview") == null ? 0 : Integer.parseInt(request.getParameter("idxReview"));
		String isbn = request.getParameter("isbn") == null ? "" : request.getParameter("isbn");
		
		HttpSession session = request.getSession();
		String email = session.getAttribute("sEmail") == null ? "none" : ""+session.getAttribute("sEmail");
		String res = "";
		
		if(email.equals("none")) {
			res = "mustLogin";
			response.getWriter().write(res);
			return;
		}
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		/* -- 책 구매 했는지 --*/
		BookVO bookVo = new AdminDAO().getBookInfoByIsbn(isbn);
		int idxBook = bookVo.getIdx();
		
		boolean resBuy = dao.getResIsBuyer(idxUser, idxBook);
		
		if(resBuy == false) {
			res = "mustBuy";
			response.getWriter().write(res);
			return;
		}
		
		/* -- 좋아요 눌렀는지 --*/
		boolean resChk = dao.getResIsClickedLike(idxReview, idxUser);

		boolean resGeted = false;
		if(resChk == false) {
			resGeted = dao.setReviewLike(idxReview, idxUser);
		}
		else {
			resGeted = dao.deleteReviewLike(idxReview, idxUser);
		}
		
		if(resGeted == false) {
			res = "fail";
			response.getWriter().write(res);
			return;
		}
		
		res = "success";
		response.getWriter().write(res);
	}
}