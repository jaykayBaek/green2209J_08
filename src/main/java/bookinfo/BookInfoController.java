package bookinfo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.CommandGetAuthorInfoByIdx;

@WebServlet("*.bi")
public class BookInfoController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookInfoInterface command = null;
		String viewPage = "/WEB-INF/bookInfo";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/booksearch")) {
			command = new CommandGetBookInfo();
			command.execute(request, response);
			viewPage += "/bookinfo.jsp";
		}
		else if (com.equals("/getAuthorAndBookInfo")) {
			command = new CommandGetAuthorInfoByIdx();
			command.execute(request, response);
			return;
		}
		else if (com.equals("/search")) {
			command = new GetSearchResult();
			command.execute(request, response);
			viewPage += "/search.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
