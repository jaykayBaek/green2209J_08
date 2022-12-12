package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class GetAuthorInfoBak implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String author = request.getParameter("author") == null?"":request.getParameter("author");
		AdminDAO dao = new AdminDAO();
		
		JSONObject vosJson = new JSONObject(dao.getAuthorInfo(author));
		String vosStr = vosJson.toJSONString();
		System.out.println(vosJson);
		JSONArray vosArray = new JSONArray();
		vosArray.add(vosStr);		// 앞에서 json형식으로 저장한 map객체를 json배열객체에 add시켜준다.
		System.out.println(vosArray);
		
		JSONObject authorTotal = new JSONObject();
		
		authorTotal.put("vosArray", vosArray);
		String data = authorTotal.toJSONString();
		System.out.println(data);
		
		response.getWriter().write(data);
	}
}