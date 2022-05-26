package index;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import file.FileDAO;
import file.FileDTO;
@WebServlet("/index.do")
public class index_do extends HttpServlet {

	
		protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
					HttpSession session = request.getSession();
					FileDAO dao = new FileDAO();
					List<FileDTO> list = dao.myFileList();
					
					
					if( session.getAttribute("username") != null) {
						request.setAttribute("list", list);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}else {
						response.sendRedirect("/Web_jsp/login.jsp");	
					}
					

		}
}
