package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;

public class CommandSetHiddenReview implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idxReview") == null?0:Integer.parseInt(request.getParameter("idxReview"));
		String res = "fail";
		
		AdminDAO dao = new AdminDAO();
		boolean resHidden = dao.setHiddenReview(idxReview);
		
		if(resHidden==true) {
			res = "success";
		}
		
		response.getWriter().write(res);
	}
}