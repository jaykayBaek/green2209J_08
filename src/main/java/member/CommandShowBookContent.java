package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookVO;
import bookinfo.BookInfoDAO;

public class CommandShowBookContent implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookInfoDAO dao = new BookInfoDAO();
		String isbn = request.getParameter("isbn") == null?"":request.getParameter("isbn");
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = new MemberDAO().getUserInformation(email);
		int idxUser = vo.getIdx();
		
		BookVO bookVo = dao.getBookContent(isbn,idxUser);
		request.setAttribute("bookVo", bookVo);
	}

}
