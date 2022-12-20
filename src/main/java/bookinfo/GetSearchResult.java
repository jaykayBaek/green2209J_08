package bookinfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetSearchResult implements BookInfoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");

		BookInfoDAO dao = new BookInfoDAO();

		int page = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int pageList = 10;
		int totRecord = dao.getTotalRecordSearch(search);
		int totPage = (totRecord % pageList)==0 ? totRecord/pageList : (totRecord/pageList)+1;
		
		int indexNoStartPage = (page - 1) * pageList;
		
		// 블록 페이징 처리
		int blockSize = 5;
		int blockNow = (page - 1) / blockSize;
		int blockLast = (totPage - 1) / blockSize;
		
		ArrayList<SearchVO> vos = dao.getSearchResult(search, pageList, indexNoStartPage);
		
		request.setAttribute("searchVos", vos);
		request.setAttribute("search", search);

		request.setAttribute("page", page);
		request.setAttribute("totPage", totPage);

		request.setAttribute("pageList", pageList);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("blockNow", blockNow);
		request.setAttribute("blockLast", blockLast);
	}
}