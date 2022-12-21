package member;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class CommandRegister implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* - - - 회원가입 전 체킹해야 할 것들 - - -*/
		/*1. 회원 탈퇴한 이력(30일 이내 재가입 불가)
		 *2. 이미 사용중인 이메일
		 * */
		String email = request.getParameter("email") == null? "" : request.getParameter("email");
		String pwdFirst = request.getParameter("pwd_first") == null? "" : request.getParameter("pwd_first");
		String pwdLast = request.getParameter("pwd_last") == null? "" : request.getParameter("pwd_last"); 
		String name = request.getParameter("name") == null? "" : request.getParameter("name");
		String birthyear = request.getParameter("birthyear") == null? "" : request.getParameter("birthyear");
		String gender = request.getParameter("gender") == null? "" : request.getParameter("gender");
		String phoneNo = request.getParameter("phone_no") == null? "" : request.getParameter("phone_no");
		
		String postcode = request.getParameter("postcode") == null? "" : request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress") == null? "" : request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress") == null? "" : request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress") == null? "" : request.getParameter("extraAddress");
		String job = request.getParameter("job") == null? "" : request.getParameter("job");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = null;
		
		/* --- 이메일 유효성 검사 ---*/
		String regEmail = "^[\\w-\\.]{1,25}@([\\w-]+\\.)+[\\w-]{2,4}$";
		boolean isValidEmail = Pattern.matches(regEmail, email);
		
		// 탈퇴한 이력 검사. 받은 이메일이 탈퇴한 이력이 있는지 체크하고, 탈퇴했었다면 30일이 지나지 않았으면 거절
		int datePenalty = dao.checkHistoryWithrawal(email);
		
		if (datePenalty < 31) {
			request.setAttribute("msg", "failPassPenaltyDate");
			request.setAttribute("url", request.getContextPath()+"/login.member");
			return;
		}
		else {
			
		}
		
		/* --- 이메일 중복 검사 ---*/
		boolean res = dao.checkValidEmail(email);
		
		if(res) {
			request.setAttribute("msg", "failSameEmail");
			request.setAttribute("url", request.getContextPath()+"/login.member");
			return;
		}
		
		/* --- 패스워드 유효성 검사 ---*/
		if(!pwdFirst.equals(pwdLast)) {
			request.setAttribute("msg", "failJoin");
			request.setAttribute("url", request.getContextPath()+"/login.member");
			return;
		}
		
		String regPwd = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		boolean isValidPwd = Pattern.matches(regPwd, pwdFirst);
		
		String regName = "^[가-힣a-zA-Z]{2,30}$";
		boolean isValidName = Pattern.matches(regName, name);
		
		String regBirthYear = "^(19|20)\\d{2}$";
		boolean isValidBirthYear = Pattern.matches(regBirthYear, birthyear)
				;
		String regPhoneNo = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
		boolean isValidPhoneNo = Pattern.matches(regPhoneNo, phoneNo);
		
		String regDetailAddress = "^.{0,20}$";
		boolean isValidAddress = Pattern.matches(regDetailAddress, detailAddress);
		
		/* -- 정규식 체크 실패 시 --*/
		if(!(isValidEmail&&isValidPwd&&isValidName&&isValidBirthYear&&isValidPhoneNo&&isValidAddress)) {
			request.setAttribute("msg", "failJoin");
			request.setAttribute("url", request.getContextPath()+"/loginBefore.member");
			return;
		}
		
		String address = postcode +"/"+ roadAddress +"/"+ detailAddress +"/"+ extraAddress;
		
		/* --- 패스워드 암호화 ---*/
		SecurityUtil securityUtil = new SecurityUtil();
		String parsePwd = securityUtil.encryptSHA256(pwdFirst);
		String ip = request.getRemoteAddr();
		
		vo = new MemberVO();
		vo.setEmail(email);
		vo.setPassword(parsePwd);
		vo.setNameUser(name);
		vo.setBirthYear(birthyear);
		vo.setGender(gender);
		vo.setPhoneNo(phoneNo);
		vo.setAddress(address);
		vo.setJob(job);
		vo.setLastUpdatedIp(ip);
		
		/* --- 회원가입 실행 ---*/
		boolean resRegister = dao.register(vo);
		
		if(resRegister) {
				request.setAttribute("msg", "successJoin");
				request.setAttribute("url", request.getContextPath()+"/loginBefore.member");
		}
		else {
			request.setAttribute("msg", "failJoin");
			request.setAttribute("url", request.getContextPath()+"/loginBefore.member");
		}
	}
}