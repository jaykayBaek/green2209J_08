package member;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class CheckAndJoinCommand implements MemberInterface {

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
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = null;
		
		/* --- 이메일 유효성 검사 ---*/
		String regEmail = "^[\\w-\\.]{1,25}@([\\w-]+\\.)+[\\w-]{2,4}$";
		boolean isValidEmail = Pattern.matches(regEmail, email);
		
		vo = dao.checkValidEmail(email, vo);
		
		if(vo!=null) {
			int date = vo.getDateDeletedDiff();
			String bringedEmail = vo.getEmail();
			if(bringedEmail.equals(email)) {
				request.setAttribute("msg", "memEmailNo");
				request.setAttribute("url", request.getContextPath()+"/login.member");
				return;
			}
			
			/* -- 탈퇴한 이력이 있는지 확인함. 있다면 TIMESTAMPDIFF(DAY, date_deleted, now()) date_deleted_diff 가 30이상이 되어야 함--*/
			if(date < 30) {
				request.setAttribute("msg", "memDateNo");
				request.setAttribute("url", request.getContextPath()+"/login.member");
				return;
			}
			
		}
		
		/* --- 패스워드 유효성 검사 ---*/
		if(!pwdFirst.equals(pwdLast)) {
			request.setAttribute("msg", "memJoinNo");
			request.setAttribute("url", request.getContextPath()+"/login.member");
			return;
		}
		
		String regPwd = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		boolean isValidPwd = Pattern.matches(regPwd, pwdFirst);
		
		String regName = "^[가-힣a-zA-Z]{2,30}$";
		boolean isValidName = Pattern.matches(regName, name);
		
		String regBirthYear = "^(19|20)\\d{2}$";
		boolean isValidBirthYear = Pattern.matches(regBirthYear, birthyear);
		
		String regPhoneNo = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$";
		boolean isValidPhoneNo = Pattern.matches(regPhoneNo, phoneNo);
		
		String regDetailAddress = "^.{0,20}$";
		boolean isValidAddress = Pattern.matches(regDetailAddress, detailAddress);
		
		/* -- 정규식 체크 실패 시 --*/
		if(!(isValidEmail&&isValidPwd&&isValidName&&isValidBirthYear&&isValidPhoneNo&&isValidAddress)) {
			request.setAttribute("msg", "joinNo");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
			return;
		}
		
		String address = postcode + roadAddress + detailAddress + extraAddress;
		
		/* --- 패스워드 암호화 ---*/
		SecurityUtil securityUtil = new SecurityUtil();
		String parsePwd = securityUtil.encryptSHA256(pwdFirst);
//		email = reque
//				pwdFirst = re
//				pwdLast = req
//				name = reques
//				birthyear = r
//				gender = requ
//				phoneNo = req
//				             
//				postcode = re
//				roadAddress =
//				detailAddress
//				extraAddress 
//				job = request
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
		boolean resFromUser = dao.register(vo);
		int userIdx = dao.bringUserIdx(vo.getEmail());
		
		boolean resFromUserInfo = dao.inputUserInfo(userIdx);
		
		if(resFromUser && resFromUserInfo) {
				request.setAttribute("msg", "memJoinOk");
				request.setAttribute("url", request.getContextPath()+"/memLogin.member");
		}
		else {
			request.setAttribute("msg", "memJoinNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.member");
		}
	}
}