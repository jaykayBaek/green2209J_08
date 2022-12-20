package member;

import java.io.IOException;
import java.security.Security;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import conn.SecurityUtil;

public class CommandFindInputPwd implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null?"":request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo")==null?"":request.getParameter("phoneNo");
		
		MemberDAO dao = new MemberDAO();
		boolean res  = dao.hasPassword(email, phoneNo);
		String resParsed;
		String tmpStrPwd = "";
		if(res==false) {
			resParsed = "false";
		}
		else {
			resParsed = "true";
			int tmpPwd = 0;
			tmpPwd = (int)(Math.random()*90000000) + 10000000;
			tmpStrPwd = "" + tmpPwd;
			
			SecurityUtil securityUtil = new SecurityUtil();
			String pwdParsed = securityUtil.encryptSHA256(tmpStrPwd);
			
			dao.updatePassword(pwdParsed, email);
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("res", resParsed);
		map.put("tmpPwd",tmpStrPwd);
		JSONObject bringRes = new JSONObject(map);
		
		String resFindInputPwd = bringRes.toJSONString();
		
		response.getWriter().write(resFindInputPwd);
		
	}

}
