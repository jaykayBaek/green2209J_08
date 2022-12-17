package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckoutCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] idx = request.getParameterValues("checkBook");
		String tmp="";
		for(String i:idx) {
			tmp += i+",";
		}
		System.out.println("checkoutcommand"+tmp);
	}
}