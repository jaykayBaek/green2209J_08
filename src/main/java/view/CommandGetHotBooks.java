package view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import member.MemberInterface;

public class CommandGetHotBooks implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViewDAO dao = new ViewDAO();
		ArrayList<HotBookVO> vos=dao.getHotBooks();
		
		JSONArray jsonArr = new JSONArray();
		JSONObject finalObject = new JSONObject();
		
		for(HotBookVO vo : vos) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("bookIdx", vo.getBookIdx());
			map.put("productIdx", vo.getProductIdx());
			map.put("title", vo.getTitle());
			map.put("publisher", vo.getPublisher());
			map.put("isbn", vo.getIsbn());
			map.put("imgSaved", vo.getImgSaved());
			JSONObject jsonObj = new JSONObject(map);
			jsonArr.add(jsonObj);
		}
		finalObject.put("hotBooksView", jsonArr);
		
		String jsonObjParsed = finalObject.toJSONString();
		
		response.getWriter().write(jsonObjParsed);
	}
}
