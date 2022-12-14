package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.ProductVO;

public class SetProductInfoCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idxBookHiden")==null?0:Integer.parseInt(request.getParameter("idxBookHiden"));
		String pricePaper = request.getParameter("pricePaper")==null?"":request.getParameter("pricePaper");
		String priceEbook = request.getParameter("priceEbook")==null?"":request.getParameter("priceEbook");
		String rateDiscount = request.getParameter("rateDiscount")==null?"":request.getParameter("rateDiscount");
		int canReader = Integer.parseInt(request.getParameter("canReader"));
		int idxSeries = request.getParameter("idxSeries")==null?0:Integer.parseInt(request.getParameter("idxSeries"));
		
		ProductVO vo = new ProductVO();
		vo.setIdx(idx);
		vo.setPricePaper(pricePaper);
		vo.setPriceEbook(priceEbook);
		vo.setRateDiscount(rateDiscount);
		vo.setCanReader(canReader);
		vo.setIdxSeries(idxSeries);
		
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
