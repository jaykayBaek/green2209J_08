package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.member")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int grade = session.getAttribute("sGrade")==null ? 99 : (int) session.getAttribute("sGrade");
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
		else if(com.equals("/emailRes")) {
			viewPage += "/emailRes.jsp";
		}
		else if(com.equals("/findPwd")) {
			viewPage += "/find_pwd.jsp";
		}
		else if(com.equals("/findInputEmail")) {
			command = new FindInputEmail();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/findInputPwd")) {
			command = new FindInputPwd();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/loginBefore")) {
			command = new LoginBeforeCommand();
			command.execute(request, response);
			viewPage += "/login.jsp";
		}
		else if(com.equals("/loginCheck")) {
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/joinValidChk")) {
			command = new RegisterCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/validEmail")) {
			command = new ValidEmailCommand();
			command.execute(request, response);
			return;
		}
		
		/* --- 아래는 세션처리가 필요함 ---*/
		else if(com.equals("/myhome")) {
			if(grade >= 99) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/login.jsp");
				dispatcher.forward(request, response);
				return;
			}
			command = new MyhomeCommand();
			command.execute(request, response);
			viewPage += "/myhome.jsp";
		}
		else if(com.equals("/wishlist")) {
			if(grade >= 99) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/login.jsp");
				dispatcher.forward(request, response);
				return;
			}
			else {
				command = new WishlistCommand();
				command.execute(request, response);
				viewPage += "/wishlist.jsp";
			}
		}
		
		/*--- 장바구니 추가 ---*/
		else if(com.equals("/addWishlist")) {
			if(grade>=99) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/login.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
			command = new AddWishlistCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(grade >= 99) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		/*--- 로그아웃, 계정 수정창 이동 ---*/
		else if(com.equals("/logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/accountModify")) {
			viewPage += "/accountModify.jsp";
		}
		/*--- 장바구니 제거 ---*/
		else if(com.equals("/removeWishlist")) {
			command = new RemoveWishlistCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		/*--- 장바구니 뷰에서 도서 제거 ---*/
		else if(com.equals("/deleteBookWishlist")) {
			command = new DeleteBookWishlist();
			command.execute(request, response);
			return;
		}
		/*--- 장바구니 뷰에서 선택된 도서 제거 ---*/
		else if(com.equals("/deleteBooksWishlist")) {
			command = new DeleteBooksWishlist();
			command.execute(request, response);
			return;
		}
		/*--- 체크아웃 ---*/
		else if(com.equals("/checkout")) {
			command = new CheckoutCommand();
			command.execute(request, response);
			viewPage += "/accountModify.jsp";
		}
		
		/*--- 미구현 ---*/
		else if(com.equals("/getWishCount")) {
			command = new GetWishCount();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
