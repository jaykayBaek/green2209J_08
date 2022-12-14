package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandAddWishlist implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxProduct = request.getParameter("idxProduct")==null?0:Integer.parseInt(request.getParameter("idxProduct"));
		String isbn = request.getParameter("isbn")==null?"":request.getParameter("isbn");
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		
		/*--- wishlist에 상품 저장 위해서는 유저의 idx, 상품의 idx를 구해야 한다.
		 * 상품의 idx는 request로 받았으니 유저의 idx를 구해야 한다.---*/
		
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		boolean res = dao.addWishList(idxProduct, idxUser);
		if(res==false) {
			request.setAttribute("msg", "failAddWishlist");
			request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
			return;
		}
		
		request.setAttribute("msg", "successAddWishlist");
		request.setAttribute("url", request.getContextPath()+"/booksearch.bi?isbn="+isbn);
	}
}