package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WishlistCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = session.getAttribute("sEmail") == null? "" : ""+session.getAttribute("sEmail");
		
		MemberVO memberVO = dao.getUserInformation(email);
		int idxUser = memberVO.getIdx();
		
		ArrayList<WishlistVO> vos =dao.getWishlist(idxUser);
		
		request.setAttribute("vos", vos);
	}
}