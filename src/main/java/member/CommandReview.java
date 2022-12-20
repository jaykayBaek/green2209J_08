package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandReview implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rating = request.getParameter("rating") == null ? 0 : Integer.parseInt(request.getParameter("rating"));
		String spoilerCheck = request.getParameter("spoilerCheck") == null ? "":request.getParameter("spoilerCheck");
		String reviewInput = request.getParameter("reviewInput")==null ? "" : request.getParameter("reviewInput");
		int idxProduct = request.getParameter("idxProduct") == null ? 0 : Integer.parseInt(request.getParameter("idxProduct"));
		int idxBook = request.getParameter("idxBook") == null ? 0 : Integer.parseInt(request.getParameter("idxBook"));
		String isbn = request.getParameter("isbn") == null ? "" : request.getParameter("isbn");
		
		
		/*--- 해당하는 도서에 리뷰를 달았는지 유효성 검사를 해줘야 한다. ---*/
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		boolean hasRes = dao.getReview(idxUser, idxProduct);
		
		if(hasRes == true) {
			request.setAttribute("msg", "failReviewInput");
			request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
			return;
		}
		int spoilCheck = 0;
		if(spoilerCheck.equals("on")) {
			spoilCheck = 1;
		}

		ReviewVO reviewVO = new ReviewVO();

		/* 구매자인지 확인 */
		boolean isBuyer = dao.getResIsBuyer(idxUser, idxBook);
		if(isBuyer == true) {
			reviewVO.setBuyCheck(1);
		}
		else {
			reviewVO.setBuyCheck(0);
		}
		
		reviewVO.setIdxProduct(idxProduct);
		reviewVO.setIdxUser(idxUser);
		reviewVO.setContentReview(reviewInput);
		reviewVO.setStarRating(rating);
		reviewVO.setSpoilerCheck(spoilCheck);
		
		boolean setRes = dao.setReview(reviewVO);
		
		if(setRes == false) {
			request.setAttribute("msg", "failReview");
			request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
			return;
		}
		request.setAttribute("msg", "successReview");
		request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
	}
}