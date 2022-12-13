package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.BookVO;

public class SetBookInfoCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서버에 저장될 파일의 경로
		String realPath = request.getServletContext().getRealPath("/data/books");
		int maxSize = 1024 * 1024 * 10; //파일업로드 시 최대 용량= 10MB
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		String imgSaved = multipartRequest.getFilesystemName("bookImg"); //서버에 저장된 파일명
		
		String title = multipartRequest.getParameter("title")==null? "" : multipartRequest.getParameter("title");
		String publisher = multipartRequest.getParameter("publisher")==null? "" : multipartRequest.getParameter("publisher");
		String datePublishing = multipartRequest.getParameter("datePublishing")==null? "" : multipartRequest.getParameter("datePublishing");
		String isbn = multipartRequest.getParameter("isbn")==null? "" : multipartRequest.getParameter("isbn");
		String textContent = multipartRequest.getParameter("textContent")==null? "" : multipartRequest.getParameter("textContent");
		
		String categoryMain = multipartRequest.getParameter("main")==null?"":multipartRequest.getParameter("main");
		String categoryNation = multipartRequest.getParameter("nation")==null?"":multipartRequest.getParameter("nation");
		String categorySub = multipartRequest.getParameter("sub")==null?"":multipartRequest.getParameter("sub");
		String[] idxAuthorArr = multipartRequest.getParameterValues("idxAuthor");
		
		/*--- 책 등록하기 ---*/
		AdminDAO dao = new AdminDAO();
		BookVO bookVo = new BookVO();
		
		bookVo.setTitle(title);
		bookVo.setPublisher(publisher);
		bookVo.setDatePublishing(datePublishing);
		bookVo.setIsbn(isbn);
		bookVo.setTextContent(textContent);
		bookVo.setCategorySub(categorySub);
		bookVo.setCategoryMain(categoryMain);
		bookVo.setCategoryNation(categoryNation);
		bookVo.setImgSaved(imgSaved);
		
		String res = dao.setBookInfo(bookVo);
		if(res.equals("0")) {
			request.setAttribute("msg", "failEnrollBook");
			request.setAttribute("url", request.getContextPath()+"/adRegisterBook.ad");
			return;
		}
		/*book_author 테이블에 정보를 기입하기 위해, 이전에 등록했던 도서의 idx를 가져온다*/
		String idxBook = dao.getIdxBook(isbn);
		
		dao.setBookAuthorInfo(idxBook,idxAuthorArr);
		
		if(res.equals("1")) {
			request.setAttribute("msg", "successEnrollBook");
			request.setAttribute("url", request.getContextPath()+"/adRegisterBook.ad");
		}
	}
}