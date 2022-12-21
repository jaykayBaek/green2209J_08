package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.CommandValidEmail;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int grade = session.getAttribute("sGrade")==null ? 99 : (int) session.getAttribute("sGrade");
		
		if(grade >= 99) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
		/*--- 사이트 접속 ---*/
		else if(com.equals("/adMain")) {
			viewPage += "/adMain.jsp";
		}
		else if(com.equals("/adRegisterBook")) {
			viewPage += "/adRegisterBook.jsp";
		}
		else if(com.equals("/adRegisterProduct")) {
			viewPage += "/adRegisterProduct.jsp";
		}
		else if(com.equals("/adRegisterAuthor")) {
			viewPage += "/adRegisterAuthor.jsp";
		}
		else if(com.equals("/adRegisterSeries")) {
			viewPage += "/adRegisterSeries.jsp";
		}
		/*--- 리뷰 관리창 ---*/
		else if(com.equals("/adManageReview")) {
			command = new CommandManageReview();
			command.execute(request, response);
			viewPage += "/adManageReview.jsp";
		}
		/*--- 리뷰 관리창 ---*/
		else if(com.equals("/adUpdateHidden")) {
			command = new CommandUpdateHidden();
			command.execute(request, response);
			return;
		}
		
		/* --- 커맨드 호출 등 작업 ---*/
		else if(com.equals("/inputAuthorInfo")) {
			command = new CommandInputAuthorInfo();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getAuthorInfoByName")) {
			command = new CommandGetAuthorInfoByName();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getAuthorInfoByIdx")) {
			command = new CommandGetAuthorInfoByIdx();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/setBookInfo")) {
			command = new CommandSetBookInfo();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/setProductInfo")) {
			command = new CommandSetProductInfo();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/getBookInfoByIsbn")) {
			command = new CommandGetBookInfoByIsbnCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/getBookInfoByIdx")) {
			command = new CommandGetBookInfoByIdx();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/setSeriesInfo")) {
			command = new CommandSetSeriesInfo();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/getSeriesIdxByTitle")) {
			command = new CommandGetSeriesIdxByTitleCommand();
			command.execute(request, response);
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
