package member;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinValidChkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* - - - 회원가입 전 체킹해야 할 것들 - - -*/
		/*1. 회원 탈퇴한 이력(30일 이내 재가입 불가)
		 *2. 이미 사용중인 이메일
		 *3. 하나의 핸드폰 번호당 2개의 계정만 허용할 예정이다
		 * */
		String email = request.getParameter("email");
		String pwdFirst = request.getParameter("pwd_first");
		String pwdLast = request.getParameter("pwd_last");
		String name = request.getParameter("name");
		String birthyear = request.getParameter("birthyear");
		String gender = request.getParameter("gender");
		String phoneNo = request.getParameter("phone_no");
		
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String job = request.getParameter("job");
		
		String regEmail = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		boolean isValidEmail = Pattern.matches(email, regEmail);
		
		if(!pwdFirst.equals(pwdLast)) {
			request.setAttribute("msg", "memJoinNo");
			request.setAttribute("url", request.getContextPath()+"/login.member");
			return;
		}
		
		String regPwd = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		boolean isValidPwd = Pattern.matches(regEmail, regPwd);
		
		String regName = "^[가-힣a-zA-Z]{2,30}$";
		boolean isValidName = Pattern.matches(name, regName);
		
		String regBirthYear = "^(?:19|20)\\d\\d";
		boolean isValidBirthYear = Pattern.matches(birthyear, regBirthYear);
		
		String regPhoneNo = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
		boolean isValidPhoneNo = Pattern.matches(phoneNo, regPhoneNo);
		
//		detailAddress 상세 주소 유효성 검사 해줘야 함.20글자 넘으면 false
		String regDetailAddress = "^.{0,20}$";
		boolean isValidAddress = Pattern.matches(detailAddress, regDetailAddress);
		
		if(!(isValidPwd&&isValidName&&isValidBirthYear&&isValidPhoneNo&&isValidAddress)) {
			request.setAttribute("msg", "joinNo");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		
	}
}