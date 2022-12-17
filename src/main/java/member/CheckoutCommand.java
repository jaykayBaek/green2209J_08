package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] idx = request.getParameterValues("checkBook");
		
		String idxProduct="";
		
		for(String i:idx) {
			idxProduct += i+",";
		}
		idxProduct=idxProduct.substring(0,idxProduct.lastIndexOf(","));
		
		MemberDAO dao = new MemberDAO();
		ArrayList<E> vos = dao.getCheckout();
			
	}
}