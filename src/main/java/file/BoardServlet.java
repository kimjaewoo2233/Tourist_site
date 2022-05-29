package file;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/down.do")
public class BoardServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			String oName = request.getParameter("oName");
			String sName = request.getParameter("sName");
			
			FileUtil.download(request, response, "/fileSave", sName, oName);
	}

}
