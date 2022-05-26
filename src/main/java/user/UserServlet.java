package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class UserServlet extends HttpServlet {
		
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			
			UserDAO dao = new UserDAO();
			
			UserDTO dto = dao.getUserDTO(id, pass);
			if(dto.getUsername() != null) {
				HttpSession session = request.getSession();
				session.setAttribute("username", id);
				session.setAttribute("email", dto.getEmail());
				session.setMaxInactiveInterval(1800);
				response.sendRedirect("/Web_jsp/index.do");
				
			}else {
				response.sendRedirect("/Web_jsp/login.jsp?found=not");
			}
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			String status = request.getParameter("status");
			HttpSession session = request.getSession();
			if(status != null) {
				session.removeAttribute("username");
				session.removeAttribute("email");
				response.sendRedirect("/Web_jsp/login.jsp");
			}
				
			
	}
	
}
