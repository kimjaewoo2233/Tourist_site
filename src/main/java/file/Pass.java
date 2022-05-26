package file;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JDBC.AlrtJs;
import user.UserDAO;
import user.UserDTO;


@WebServlet("/pass.do")
public class Pass extends HttpServlet {

	
		protected void doGet(HttpServletRequest request
							,HttpServletResponse response
				)throws ServletException,IOException{
			
			String id = request.getParameter("id");
			FileDAO dao = new FileDAO();
			FileDTO dto = dao.selectView(id);
			UserDAO userDao = new UserDAO();
			UserDTO userDto = userDao.getEmailUserDTO(dto.getName());
			String mode = request.getParameter("mode");
			int deleteResult = 0;
			HttpSession session = request.getSession();
			String session_email = (String)session.getAttribute("email");
		
			
			if(mode.equals("edit")) {
				if(session_email.equals(userDto.getEmail())){
					String url = "/Web_jsp/edit.do?id="+id;
					response.sendRedirect(url);
				}	
			}else if(mode.equals("delete")) {
				System.out.println("pass-----"+id);
				deleteResult = dao.deletePost(id);
				System.out.println("pass-----"+deleteResult);
				if(deleteResult == 1) {
					response.sendRedirect("/Web_jsp/board/board.jsp");
				}else {
					AlrtJs.alertBack(response, "다시 시도해주세요");
				}
			}
			
		}
}
