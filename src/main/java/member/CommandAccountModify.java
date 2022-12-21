package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandAccountModify implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = "" + session.getAttribute("sEmail");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInformation(email);
		request.setAttribute("vo", vo);
	}	
}