package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.ProductVO;

public class SetProductInfoCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idxBookHiden")==null?0:Integer.parseInt(request.getParameter("idxBookHiden"));
		String pricePaper = request.getParameter("pricePaper")==null?
				(pricePaper = request.getParameter("pricePaper")=="" ? "없음" : request.getParameter("pricePaper")):
				request.getParameter("pricePaper");
		
		String priceEbook = request.getParameter("priceEbook")==null?"":request.getParameter("priceEbook");
		String rateDiscount = request.getParameter("rateDiscount")==null?"":request.getParameter("rateDiscount");
		int canReader = Integer.parseInt(request.getParameter("canReader"));
		
		int idxSeries;
		if(request.getParameter("idxSeries")==null) {
			idxSeries = 1;
		}
		if(request.getParameter("idxSeries").equals("")) {
			idxSeries = 1;
		}
		else {
			idxSeries = Integer.parseInt(request.getParameter("idxSeries"));
		}
		
		String textIntroduce = request.getParameter("textIntroduce")==null?"":request.getParameter("textIntroduce");
		
		ProductVO vo = new ProductVO();
		vo.setIdxBook(idx);
		vo.setPricePaper(pricePaper);
		vo.setPriceEbook(priceEbook);
		vo.setRateDiscount(rateDiscount);
		vo.setCanReader(canReader);
		vo.setIdxSeries(idxSeries);
		vo.setTextIntroduce(textIntroduce);
		
		AdminDAO dao = new AdminDAO();
		String res = dao.setProductInfo(vo);
		
		if(res.equals("1")) {
			request.setAttribute("msg", "successEnrollProduct");
		}
		else {
			request.setAttribute("msg", "failEnrollProduct");
		}
		
		request.setAttribute("url", request.getContextPath()+"/adRegisterProduct.ad");
		
	}

}
