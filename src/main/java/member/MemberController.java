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
			command = new CommandFindInputEmail();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/findInputPwd")) {
			command = new CommandFindInputPwd();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/loginBefore")) {
			command = new CommandLoginBefore();
			command.execute(request, response);
			viewPage += "/login.jsp";
		}
		else if(com.equals("/loginCheck")) {
			command = new CommandLogin();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/joinValidChk")) {
			command = new CommandRegister();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/validEmail")) {
			command = new CommandValidEmail();
			command.execute(request, response);
			return;
		}
		/*--- 리뷰에 단 댓글 확인하기 ---*/
		else if(com.equals("/getReviewCmt")) {
			command = new CommandGetReviewCmt();
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
			command = new CommandMyhome();
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
				command = new CommandWishlist();
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
			command = new CommandAddWishlist();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(grade >= 99) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/login.jsp");
			dispatcher.forward(request, response);
			return;
		}
		/*--- 내 서재 이동---*/
		else if(com.equals("/mylib")) {
			command = new CommandMyLib();
			command.execute(request, response);
			viewPage += "/mylib.jsp";
		}
		else if(com.equals("/mylibDetail")) {
			command = new CommandMyLibDetail();
			command.execute(request, response);
			viewPage += "/mylibDetail.jsp";
		}
		else if(com.equals("/showBookContent")) {
			command = new CommandShowBookContent();
			command.execute(request, response);
			viewPage += "/showBookContent.jsp";
		}
		/*--- 로그아웃, 계정 수정창 이동 ---*/
		else if(com.equals("/logout")) {
			command = new CommandLogout();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/accountModify")) {
			viewPage += "/accountModify.jsp";
		}
		/*--- 장바구니 제거 ---*/
		else if(com.equals("/removeWishlist")) {
			command = new CommandRemoveWishlist();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		/*--- 장바구니 뷰에서 도서 제거 ---*/
		else if(com.equals("/clearBook")) {
			command = new CommandClearBook();
			command.execute(request, response);
			return;
		}
		/*--- 장바구니 뷰에서 선택된 도서 제거 ---*/
		else if(com.equals("/clearSelectedBook")) {
			command = new CommandClearSelectedBook();
			command.execute(request, response);
			return;
		}
		/*--- 체크아웃 ---*/
		else if(com.equals("/checkout")) {
			command = new CommandCheckout();
			command.execute(request, response);
			viewPage += "/checkout.jsp";
		}
		// 체크아웃 이후, 결제 시 결제 처리
		else if(com.equals("/orderBook")) {
			command = new CommandOrderBook();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		/*--- 장바구니에 담긴 개수 ---*/
		else if(com.equals("/getWishCount")) {
			command = new CommandGetWishCount();
			command.execute(request, response);
			return;
		}
		/*--- 내책권수 ---*/
		else if(com.equals("/getMybookCount")) {
			command = new CommandGetMyBookCount();
			command.execute(request, response);
			return;
		}
		
		/*--- 결제내역 가기 ---*/
		else if(com.equals("/myPayment")) {
			command = new CommandMyPayment();
			command.execute(request, response);
			viewPage += "/myPayment.jsp";
		}
		else if(com.equals("/myPaymentDetail")) {
			command = new CommandMyPaymentDetail();
			command.execute(request, response);
			viewPage += "/myPaymentDetail.jsp";
		}
		
		/*--- 리뷰 달기 ---*/
		else if(com.equals("/review")) {
			command = new CommandReview();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		/*--- 리뷰 지우기 ---*/
		else if(com.equals("/deleteReview")) {
			command = new CommandDeleteReview();
			command.execute(request, response);
			return;
		}
		/*--- 리뷰에 댓글 달기 ---*/
		else if(com.equals("/setReviewCmt")) {
			command = new CommandSetReviewCmt();
			command.execute(request, response);
			return;
		}
		/*--- 리뷰에 댓글 지우기 ---*/
		else if(com.equals("/deleteReviewCmt")) {
			command = new CommandDeleteReviewCmt();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		/*--- 리뷰 좋아요 토글 ---*/
		else if(com.equals("/checkAndSetLike")) {
			command = new CommandCheckAndSetLike();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
