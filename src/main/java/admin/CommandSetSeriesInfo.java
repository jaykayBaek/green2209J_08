package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.ProductSeriesVO;

public class CommandSetSeriesInfo implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/books");
		int maxSize = 1024 * 1024 * 10; //파일업로드 시 최대 용량= 10MB
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String imgSaved = multipartRequest.getFilesystemName("bookImg"); //서버에 저장된 파일명
		
		String title = multipartRequest.getParameter("title")==null?"":multipartRequest.getParameter("title");
		String price = multipartRequest.getParameter("price")==null?"":multipartRequest.getParameter("price");
		String rateDiscount = multipartRequest.getParameter("rateDiscount")==null?"":multipartRequest.getParameter("rateDiscount");
		String isbnSeries = multipartRequest.getParameter("isbnSeries")==null?"":multipartRequest.getParameter("isbnSeries");
		
		ProductSeriesVO vo = new ProductSeriesVO();
		vo.setTitleSeries(title);
		vo.setPriceSeries(price);
		vo.setRateDiscount(rateDiscount);
		vo.setIsbnSeries(isbnSeries);
		vo.setImgSaved(imgSaved);
		
		AdminDAO dao = new AdminDAO();
		String res = dao.setSeriesInfo(vo);
		
		if(res.equals("1")) {
			request.setAttribute("msg", "successEnrollSeries");
		}
		else {
			request.setAttribute("msg", "failEnrollSeries");
		}
		request.setAttribute("url", request.getContextPath()+"/adRegisterSeries.ad");
	}

}
