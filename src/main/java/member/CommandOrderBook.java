package member;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandOrderBook implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] productIdxArr = request.getParameterValues("idxProduct");
		int priceTot = request.getParameterValues("priceTot")==null?0:Integer.parseInt(request.getParameter("priceTot"));
		int priceSalesTot = request.getParameterValues("priceSalesTot")==null?0:Integer.parseInt(request.getParameter("priceSalesTot"));
		int pointUsed = request.getParameter("point") == null? 0 : Integer.parseInt(request.getParameter("point"));
		String paymentMethod = request.getParameter("paymentMethod") == null? "" : request.getParameter("paymentMethod");

		if(paymentMethod.equals("card")) {
			paymentMethod = "카드";
		}
		else {
			paymentMethod = "무통장 입금";
		}
		
		if(pointUsed>0){
			paymentMethod = paymentMethod + " + 포인트";
		}

		/*insert문에 넣을 상품 idx 구하기*/
		String productIdx = "";
		
		for(String tmp:productIdxArr) {
			productIdx += tmp+",";
		}
		
		productIdx = productIdx.substring(0, productIdx.lastIndexOf(","));
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO memberVO = dao.getUserInformation(email);
		
		if(pointUsed > Integer.parseInt(memberVO.getPoint())) {
			request.setAttribute("msg", "suspiousPoint");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		
		/* -- 주문번호 생성 알고리즘
		 * 1. 앞 8자 년월일 (20220101)
		 * 2. 뒤 4자 1000부터 스타트 한 후 주문 수만큼 +1
		 * 2번을 구하기 위해 오늘날짜로 주문 내역 DB 조회한 후 substring으로 끝에서 4자리 짤라 값을 가져와 한다. -- */
		
        LocalDate now = LocalDate.now();
        DateTimeFormatter dateFmt = DateTimeFormatter.ofPattern("yyyyMMdd");
        
        String nowFormated = now.format(dateFmt);
		
		String datePurchased = dao.getDatePurchased();
        String orderNo = "";
        if(datePurchased.equals("")) {
        	orderNo = nowFormated+"1000";
        }
        else {
        	int orderCnt = Integer.parseInt(datePurchased.substring(datePurchased.length()-4, datePurchased.length()));
        	orderCnt++;
        	orderNo = nowFormated+""+orderCnt;
        }
        
		OrderListVO listVO = new OrderListVO();
		
		int pointEarned = (int)(priceTot * 0.02);
		
		listVO.setIdxUser(memberVO.getIdx());
		listVO.setOrderNo(orderNo);
		listVO.setPriceOrder(priceTot);
		listVO.setPriceSales(priceSalesTot);
		listVO.setPricePointUsed(pointUsed);
		listVO.setPricePayment(priceTot-priceSalesTot);
		listVO.setOptionChoosed(paymentMethod);
		listVO.setPointEarned(pointEarned);
		listVO.setBirthYear(memberVO.getBirthYear());
		listVO.setPhoneNo(memberVO.getPhoneNo());
		listVO.setGender(memberVO.getGender());
		listVO.setJob(memberVO.getJob());
		
		/*--- 결제내역 작성 ---*/
		boolean olRes = dao.setOrderList(listVO);
		if(olRes == false){
			request.setAttribute("msg", "failOrderBook");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		/*--- 결제내역 책 작성 ---*/
		int idxOrderList = dao.getOrderListIdx(memberVO.getIdx());
		dao.setOrderListBook(idxOrderList, productIdxArr);
		
		/*--- 장바구니에서 구매한 책 제거 ---*/
		dao.removeWishlist(productIdx, memberVO.getIdx());
		
		/*--- 내 서고에 저장 ---*/
		// product idx 로 book idx를 구해야 함.
		ArrayList<String> bookIdx = dao.getIdxProduct(productIdx, memberVO.getIdx());
		boolean mlRes = dao.setMyLib(bookIdx, memberVO.getIdx());
		
		
		if(mlRes == false) {
			request.setAttribute("msg", "failOrderBook");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		
		/*--- 적립 포인트 추가 및 제거 ---*/
		boolean apRes = dao.addPoint(pointEarned, memberVO.getIdx());
		boolean spRes = dao.subtractPoint(pointUsed, memberVO.getIdx());
		
		if(apRes == false || spRes == false) {
			request.setAttribute("msg", "failOrderBook");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		
		request.setAttribute("msg", "successOrderBook");
		request.setAttribute("url", request.getContextPath()+"/");
	}
}