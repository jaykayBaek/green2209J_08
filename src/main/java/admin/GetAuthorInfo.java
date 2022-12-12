package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class GetAuthorInfo implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String author = request.getParameter("author") == null?"":request.getParameter("author");
		AdminDAO dao = new AdminDAO();
		JSONObject bringData = dao.getAuthorInfo(author);
		
		String bringDataParsed = bringData.toJSONString();
		
		response.getWriter().write(bringDataParsed);
	}
}