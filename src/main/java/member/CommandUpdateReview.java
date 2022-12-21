package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandUpdateReview implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		int spoilerCheck = request.getParameter("spoilerCheck") == null ? 0 : Integer.parseInt(request.getParameter("spoilerCheck"));
		

		MemberDAO dao = new MemberDAO();
		String res = "";
		boolean resUpddate = dao.updateReview(idxReview, content, spoilerCheck);
		
		if(resUpddate == false) {
			res = "fail";
		}
		else {
			res = "success";
		}
		
		response.getWriter().write(res);
	}
}