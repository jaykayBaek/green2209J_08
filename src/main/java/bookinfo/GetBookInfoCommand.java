package bookinfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.AuthorProfileVO;
import member.MemberInterface;

public class GetBookInfoCommand implements MemberInterface {

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
		
		request.setAttribute("bookInfoVo", bookInfoVo);
		request.setAttribute("authorVos", authorVos);
		
		/*--- 시리즈가 없는 상품은 리턴 ---*/
		if(bookInfoVo.getIdxProductSeries()==1) {
			return;
		}
		int idxProductSeries = bookInfoVo.getIdxProductSeries();
		
		/*---시리즈 뷰 구하기---*/
		ArrayList<SeriesInfoVO> seriesVos = dao.getSeriesInfo(idxProductSeries);
		request.setAttribute("seriesVos", seriesVos);
		
	}
}
