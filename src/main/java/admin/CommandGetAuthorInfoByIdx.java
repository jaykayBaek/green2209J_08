package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bookinfo.BookInfoInterface;

public class CommandGetAuthorInfoByIdx implements BookInfoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		AdminDAO dao = new AdminDAO();
		JSONObject bringData = dao.getAuthorInfoByIdx(idx);
		
		String bringDataParsed = bringData.toJSONString();
		
		response.getWriter().write(bringDataParsed);
	}

}
