package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommandMyLibDetail implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbnSeries = request.getParameter("isbn")==null?"":request.getParameter("isbn");
		int idxProductSeries = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String email = ""+session.getAttribute("sEmail");
		MemberVO vo = dao.getUserInformation(email);
		int idxUser = vo.getIdx();
		
		ArrayList<MyBookVO> vos = dao.getBuyedBookInSeries(idxProductSeries, idxUser);
		
		for(MyBookVO tmp : vos) {
			tmp.getImgSaved();
		}
		
		request.setAttribute("vos", vos);
	}
}