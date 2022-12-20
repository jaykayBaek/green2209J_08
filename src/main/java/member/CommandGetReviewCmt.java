package member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CommandGetReviewCmt implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxReview = request.getParameter("idxReview") == null? 0 : Integer.parseInt(request.getParameter("idxReview"));
		HttpSession session = request.getSession();

		MemberDAO dao = new MemberDAO();
		
		ArrayList<ReviewCmtVO> vos = dao.getReviewCmt(idxReview);
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		for(ReviewCmtVO vo : vos) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("idxCmt",vo.getIdxCmt());
			map.put("idxReview",vo.getIdxReview());
			map.put("idxUser",vo.getIdxUser());
			map.put("contentReply",vo.getContentReply());
			map.put("dateCreated",vo.getDateCreated());
			map.put("hidden",vo.getHidden());
			map.put("email",vo.getEmail());
			JSONObject tmp = new JSONObject(map);
			arr.add(tmp);
		}
		obj.put("cmt", arr);
		String finalObj = obj.toJSONString();
		
		response.getWriter().write(finalObj);
	}
}
