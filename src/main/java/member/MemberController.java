package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.member")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		/* - - - 사이트 접속 처리 - - - */
		if(com.equals("/signBefore")) {
			viewPage += "/signBefore.jsp";
		}
		else if(com.equals("/signup")) {
			viewPage += "/signup.jsp";
		}
		else if(com.equals("/findEmail")) {
			viewPage += "/find_email.jsp";
		}
		else if(com.equals("/findPwd")) {
			viewPage += "/find_pwd.jsp";
		}
		else if(com.equals("/login")) {
			viewPage += "/login.jsp";
		}
		else if(com.equals("/myhome")) {
			viewPage += "/myhome.jsp";
		}
		else if(com.equals("/wishlist")) {
			viewPage += "/wishlist.jsp";
		}
		
		
		/* - - - 유효성 검사, dao 작업 등 command 호출 처리 - - -*/
		else if(com.equals("/joinValidChk")) {
			command = new ChkAndJoinCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
