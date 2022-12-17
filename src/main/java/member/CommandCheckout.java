package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandCheckout implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] idx = request.getParameterValues("checkBook");
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		
		String idxProduct="";
		
		for(String i:idx) {
			idxProduct += i+",";
		}
		idxProduct=idxProduct.substring(0,idxProduct.lastIndexOf(","));
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<CheckoutVO> vos= dao.getCheckout(idxProduct);
		
		int priceEbookTot = 0;
		int priceSalesTot = 0;
		int priceCalcTot;
		int cnt = 0;
		for(CheckoutVO vo : vos) {
			cnt++;
			int priceEbook = Integer.parseInt(vo.getPriceEbook());
			priceEbookTot += priceEbook;
			
			int rateDiscount = Integer.parseInt(vo.getRateDiscount());
			priceSalesTot += (int)(priceEbook * rateDiscount * 0.01);
		}
		
		priceCalcTot = priceEbookTot - priceSalesTot;
		
		
		/* DB에 저장되어 있는 point 구하기 */
		MemberVO vo = dao.getUserInformation(email);
		int point = Integer.parseInt(vo.getPoint());
		
		/* 적립 예상 포인트 구하기 */
		int pointExpected = (int)(priceCalcTot * 0.02);
		
		request.setAttribute("vos", vos);
		request.setAttribute("cnt", cnt);
		request.setAttribute("priceCalcTot", priceCalcTot);
		request.setAttribute("priceSalesTot", priceSalesTot);
		request.setAttribute("priceEbookTot", priceEbookTot);
		request.setAttribute("point", point);
		request.setAttribute("pointExpected", pointExpected);
	}
}