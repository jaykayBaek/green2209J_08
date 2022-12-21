package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.ProductVO;

public class CommandSetProductInfo implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idxBookHiden")==null?0:Integer.parseInt(request.getParameter("idxBookHiden"));
		String pricePaper = request.getParameter("pricePaper")==null?"없음":(pricePaper = request.getParameter("pricePaper")=="" ? "없음" : request.getParameter("pricePaper"));
		
		String priceEbook = request.getParameter("priceEbook")==null?"":request.getParameter("priceEbook");
		String rateDiscount = request.getParameter("rateDiscount")==null?"":request.getParameter("rateDiscount");
		String canReader = request.getParameter("canReader");
		
		int idxSeries = request.getParameter("idxSeries")==null?1:request.getParameter("idxSeries")==""?1:Integer.parseInt(request.getParameter("idxSeries"));
		
		
		String textIntroduce = request.getParameter("textIntroduce")==null?"":request.getParameter("textIntroduce");
		
		ProductVO vo = new ProductVO();
		vo.setIdxBook(idx);
		vo.setPricePaper(pricePaper);
		vo.setPriceEbook(priceEbook);
		vo.setRateDiscount(rateDiscount);
		vo.setCanReader(Integer.parseInt(canReader));
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
