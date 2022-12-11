package member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class FindInputEmail implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		String phoneNo = request.getParameter("phoneNo")==null?"":request.getParameter("phoneNo");
		
		MemberDAO dao = new MemberDAO();
		String email = dao.findForgetEmail(name, phoneNo);
		
		
		String res = "";
		if(email.equals("")) {
			res = "false";
		}
		else {
			res = "true";
			String[] emailArr = email.split("@");
			
			String star = "";
			for(int i = 0; i<emailArr[0].substring(3).length(); i++){
				star += "*";
			}
			
			emailArr[0] = emailArr[0].replace(emailArr[0].substring(3), star);
			email = emailArr[0]+"@"+emailArr[1];
		}
		HashMap<String, String> map = new HashMap<>();
		map.put("res", res);
		map.put("email", email);
		JSONObject bringRes = new JSONObject(map);
		
		String resFindInputEmail = bringRes.toJSONString();
		
		response.getWriter().write(resFindInputEmail);
	}
}
