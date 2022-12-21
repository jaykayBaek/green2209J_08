package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandUpdateHidden implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String res = "fail";
		AdminDAO dao = new AdminDAO();
		
		boolean resUpdate = dao.updateHidden(idxReview);
		if(resUpdate==true) {
			res = "success";
		}
		response.getWriter().write(res);
	}
}