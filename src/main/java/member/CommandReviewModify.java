package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandReviewModify implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		String email = ""+session.getAttribute("sEmail");
		
		MemberVO vo = dao.getUserInformation(email);
		
		int idxUser = vo.getIdx();
		
		ArrayList<ReviewVO> vos = dao.getReviewContent(idxUser);
		
		request.setAttribute("vos", vos);
	}
}