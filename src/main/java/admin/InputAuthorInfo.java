package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InputAuthorInfo implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameAuthor = request.getParameter("nameAuthor") == null?"":request.getParameter("nameAuthor");
		String role = request.getParameter("role");
		String nationality = request.getParameter("nationality")==null?"":request.getParameter("nationality");
		String birthday = request.getParameter("birthday")==null?"없음":request.getParameter("birthday");
		
		String awardYear[] = request.getParameterValues("awardYear");
		String award[] = request.getParameterValues("award");
		String awardHistory = "";
		if(!(awardYear==null||award==null)) {
			for(int i=0; i<award.length; i++) {
				awardHistory += awardYear[i] +"년"+ award[i]+"/";
			}
		} else {
			awardHistory = "없음";
		}
		
		String education[] = request.getParameterValues("education");
		String eduHistory = "";
		for(int i=0; i<education.length; i++) {
			eduHistory += education[i]+"/";
		}
		
		String introduceTxt = request.getParameter("introduceTxt")==null?"":request.getParameter("introduceTxt");
		
		AdminDAO dao = new AdminDAO();
		
		String res = dao.setAuthorInfo(nameAuthor, role, nationality, birthday, awardHistory, eduHistory, introduceTxt);
		response.getWriter().write(res);
	}
}