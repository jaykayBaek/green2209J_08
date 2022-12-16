package bookinfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;

public interface BookInfoInterface extends AdminInterface {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
	