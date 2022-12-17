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
		/* 장바구니 초기화면에 뿌려줄 금액들을 구함
		 * 구해야 하는 금액은?
		 * 1. 총 주문 금액(장바구니에 있는 ebook의 원가들의 합)
		 * 2. 할인 금액(ebook들의 할인율*ebook 원가를 계산해서 누적한 금액)
		 * 3. 합계는 총 주문금액-할인금액의 값
		 * 4. cnt(몇 건 장바구니에 있는지)*/
		
		int priceTotal = 0;
		int priceSales = 0;
		int priceCalc = 0;
		int cnt = 0;
		for(WishlistVO vo : vos) {
			priceTotal += Integer.parseInt(vo.getPriceEbook());
			int rateDiscount = Integer.parseInt(vo.getRateDiscount());
			priceSales += (int) (Integer.parseInt(vo.getPriceEbook()) * rateDiscount * 0.01);
			cnt ++;
		}
		
		priceCalc = priceTotal - priceSales;
		
		request.setAttribute("vos", vos);
		request.setAttribute("priceCalc", priceCalc);
		request.setAttribute("priceTotal", priceTotal);
		request.setAttribute("priceSales", priceSales);
		request.setAttribute("cnt", cnt);
	}
}