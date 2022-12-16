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
		
		ArrayList<WishlistVO> vos = dao.getWishlist(idxUser);
		
		for(WishlistVO vo : vos) {
			int priceEbook = Integer.parseInt(vo.getPriceEbook());
			int rateDiscount = Integer.parseInt(vo.getRateDiscount());
			int priceCalculated = (int)(priceEbook * 1 - rateDiscount * 0.01);
			vo.setPriceCalculated(priceCalculated);
			vo.setPriceCalculated((int)(Integer.parseInt(vo.getPriceEbook()) * (1 - (Integer.parseInt(vo.getRateDiscount())) * 0.01)));
		}

		
		
		
		request.setAttribute("vos", vos);
	}
}