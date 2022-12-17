package member;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandOrder implements MemberInterface {

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
		
		/* -- 구매한 상품이 내 서재에 있는 중복처리 해준다. -- */
		
		/* -- 주문번호 생성 알고리즘
		 * 1. 앞 8자 년월일 (20220101)
		 * 2. 뒤 4자 1000부터 스타트 한 후 주문 수만큼 +1
		 * 2번을 구하기 위해 오늘날짜로 주문 내역 DB 조회한 후 substring으로 끝에서 4자리 짤라 값을 가져와 한다. -- */
        LocalDate now = LocalDate.now();
        DateTimeFormatter dateFmt = DateTimeFormatter.ofPattern("yyyyMMdd");
        
        String nowFormated = now.format(dateFmt);
		
        
        
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO memberVO = dao.getUserInformation(email);
		memberVO.getIdx();
		memberVO.getBirthYear();
		memberVO.getPhoneNo();
		memberVO.getGender();
		memberVO.getJob();
	}
}