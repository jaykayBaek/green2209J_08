package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandMyPaymentDetail implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderNo = request.getParameter("orderNo")==null?"0":request.getParameter("orderNo");
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO memberVO = dao.getUserInformation(email);
		int idxUser = memberVO.getIdx();
		MyPaymentVO orderVO = dao.getOrderListDetail(idxUser, orderNo);
		
		ArrayList<OrderListBookVO> bookVOS =dao.getOrderListDetailBook(orderNo, idxUser);
		
		request.setAttribute("bookVOS", bookVOS);
		request.setAttribute("orderVO", orderVO);
	}
}