package file;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class DownLoadController extends HttpServlet{

		
		protected void doGet(HttpServletRequest request,HttpServletResponse response) 
				throws ServletException, IOException {
			String ofile = request.getParameter("ofile");
			String sfile = request.getParameter("sfile");
			
			FileUtil.download(request, response, "/fileSave", sfile, ofile);
		}
}
