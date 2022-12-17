package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteBooksWishlist implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] idxProductArr = request.getParameterValues("idxProduct");
		
		if(idxProductArr==null) {
			return;
		}
		
		String idxSum = "";
		for(String idxProduct:idxProductArr) {
			idxSum += idxProduct+",";
		}
		idxSum = idxSum.substring(0,idxSum.lastIndexOf(","));
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		dao.removeWishlist(idxSum, idxUser);
	}
}
