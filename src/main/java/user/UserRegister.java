package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegister extends HttpServlet{
	int result = 0;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String email = request.getParameter("email");
				
			
					UserDAO dao= new UserDAO();
					 result = dao.setUserDTO(username, password, email);
					if(result == -1) {
						response.sendRedirect("/Web_jsp/addUser.jsp?found=not");
					}else if(result == -2) {
						response.sendRedirect("/Web_jsp/addUser.jsp?found=overlap");
					}else {
						response.sendRedirect("/Web_jsp/login.jsp?found=sus");
					}
				}
	
}
