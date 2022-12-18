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
		String email = session.getAttribute("sEmail")+"";
		MemberVO memVO = dao.getUserInformation(email);
		int idxUser = memVO.getIdx();
		
		/*
		 * int page =
		 * request.getParameter("page")==null?1:Integer.parseInt(request.getParameter(
		 * "page")); int pageSize = 15; int totalPaymentRecord =
		 * dao.getTotalPaymentRecord(idxUser); int totalPage = totalPaymentRecord %
		 * pageSize == 0? totalPaymentRecord/pageSize : (totalPaymentRecord/pageSize)
		 * +1;
		 * 
		 * int startIndexNo = (page - 1) * pageSize; int startNo = totalPaymentRecord -
		 * startIndexNo;
		 * 
		 * // 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다. int blockSize = 3; int curBlock
		 * = (page - 1) / blockSize; int lastBlock = (totalPaymentRecord - 1) /
		 * blockSize;
		 */
		
		ArrayList<MyPaymentVO> vos = dao.getOrderList(idxUser);
		
		request.setAttribute("vos", vos);
		
		/* request.setAttribute("page", page); */
		/*
		 * request.setAttribute("totalPage", totalPage);
		 * request.setAttribute("startIndexNo", startIndexNo);
		 * request.setAttribute("pageSize", pageSize); request.setAttribute("blockSize",
		 * blockSize); request.setAttribute("curBlock", curBlock);
		 * request.setAttribute("lastBlock", lastBlock);
		 */
	}
}