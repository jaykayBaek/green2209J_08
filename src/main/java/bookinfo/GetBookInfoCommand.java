package bookinfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.AuthorProfileVO;
import member.MemberDAO;
import member.MemberVO;

public class GetBookInfoCommand implements BookInfoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn") == null?"":request.getParameter("isbn");
		
		BookInfoDAO dao = new BookInfoDAO();
		
		BookInfoVO bookInfoVo = dao.getAllBookInfo(isbn);
		
		int priceEbook = Integer.parseInt(bookInfoVo.getPriceEbook());
		int rateDiscount = Integer.parseInt(bookInfoVo.getRateDiscount());
		int priceCalculated = (int)(priceEbook * (1 - rateDiscount * 0.01));
		bookInfoVo.setPriceCalculated(priceCalculated);
		
		int idxBook = bookInfoVo.getIdxBook();
		
		/*--- 작가 정보 가져오기 ---*/
		ArrayList<AuthorProfileVO> authorVos = dao.getAuthorInfo(idxBook);
		
		int idxUser = 0;
		int idxProduct = 0;
		HttpSession session = request.getSession();
		int grade = session.getAttribute("sGrade")==null ? 99 : (int) session.getAttribute("sGrade");
		if(grade >= 99) {
			bookInfoVo.setHasWishlist("0");
		}
		else {
			MemberDAO memDAO = new MemberDAO();
			String email = ""+session.getAttribute("sEmail");
			MemberVO memVo = memDAO.getUserInformation(email);
			idxUser = memVo.getIdx();
			idxProduct = bookInfoVo.getIdxProduct();
			
			/*--- 장바구니에 해당 상품 담았는지 체킹 ---*/
			String checkRes = dao.checkProductInWishlist(idxProduct, idxUser);
			if(checkRes.equals("1")) {
				bookInfoVo.setHasWishlist("1");
			}
			else {
				bookInfoVo.setHasWishlist("0");
			}
		}
		
		request.setAttribute("bookInfoVo", bookInfoVo);
		request.setAttribute("authorVos", authorVos);
		
		/*--- 시리즈가 없는 상품은 리턴 ---*/
		if(bookInfoVo.getIdxProductSeries()==1) {
			return;
		}
		
		int idxProductSeries = bookInfoVo.getIdxProductSeries();
		
		/*---시리즈 뷰 구하기---*/
		ArrayList<SeriesInfoVO> seriesVos = dao.getBookInfoInSeries(idxProductSeries);
		request.setAttribute("seriesVos", seriesVos);
		
	}
}
