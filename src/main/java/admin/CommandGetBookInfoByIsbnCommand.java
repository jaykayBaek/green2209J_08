package admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import book.BookVO;

public class CommandGetBookInfoByIsbnCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn") == null ? "" : request.getParameter("isbn");
		
		BookVO vo = null;
		AdminDAO dao = new AdminDAO();
		
		vo = dao.getBookInfoByIsbn(isbn);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", vo.getIdx());
		map.put("title", vo.getTitle());
		map.put("publisher", vo.getPublisher());
		map.put("datePublishing", vo.getDatePublishing());
		map.put("isbn", vo.getIsbn());
		map.put("imgSaved", vo.getImgSaved());
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("book", map);
		
		String jsonObjParsed = jsonObj.toJSONString();
		
		response.getWriter().write(jsonObjParsed);
	}
}