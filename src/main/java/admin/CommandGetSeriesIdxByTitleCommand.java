package admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.ProductSeriesVO;

public class CommandGetSeriesIdxByTitleCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seriesTitle = request.getParameter("seriesTitle")==null?"":request.getParameter("seriesTitle");
		
		AdminDAO dao = new AdminDAO();
		ArrayList<ProductSeriesVO> vos = dao.getSeriesIdxByTitle(seriesTitle);
		
		JSONArray jsonArr = new JSONArray();
		JSONObject finalObject = new JSONObject();
		
		for(ProductSeriesVO vo:vos) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("idx", vo.getIdx());
			map.put("titleSeries", vo.getTitleSeries());
			map.put("priceSeries", vo.getPriceSeries());
			map.put("rateDiscount", vo.getRateDiscount());
			map.put("isbnSeries", vo.getIsbnSeries());
			map.put("imgSaved", vo.getImgSaved());
			JSONObject jsonObj = new JSONObject(map);
			jsonArr.add(jsonObj);
		}
		finalObject.put("series", jsonArr);
		
		String jsonObjParsed = finalObject.toJSONString();
		
		response.getWriter().write(jsonObjParsed);
	}
}