package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteBookWishlist implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idxProduct = request.getParameter("idxProduct")==null?"":request.getParameter("idxProduct");
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		dao.removeWishlist(idxProduct, idxUser);
	}
}