package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandMyPayment implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = session.getAttribute("sEmail") + "";
		MemberVO memVO = dao.getUserInformation(email);
		int idxUser = memVO.getIdx();
		
		

		ArrayList<MyPaymentVO> vos = dao.getOrderList(idxUser);
		request.setAttribute("vos", vos);
	}
}