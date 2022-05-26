package file;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
			FileDAO dao = new FileDAO();
			String id = req.getParameter("id");
			FileDTO dto = dao.selectView(id);
			System.out.println(id);
			dao.close();
			req.setAttribute("dto", dto);
	        req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
	}
}
