package file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/upload.do")
public class WriteController extends HttpServlet {
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
	    }
	 
	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        String saveDirectory = req.getServletContext().getRealPath("/fileSave");

	        ServletContext application = getServletContext();
	        int maxPostSize =500000;

	        MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
	        if (mr == null) {
	         
	            return;
	        }

	        FileDTO dto = new FileDTO(); 
	        HttpSession session = req.getSession();
	        dto.setName((String)session.getAttribute("username"));
	        dto.setTitle(mr.getParameter("title"));
	        dto.setContent(mr.getParameter("content"));

	        String fileName = mr.getFilesystemName("ofile");
	        if (fileName != null) {
	            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            String newFileName = now + ext;

	            File oldFile = new File(saveDirectory + File.separator + fileName);
	            File newFile = new File(saveDirectory + File.separator + newFileName);
	            oldFile.renameTo(newFile);
	            
	            dto.setOfile(fileName);  // �썝�옒 �뙆�씪 �씠由�
	            dto.setSfile(newFileName);  // �꽌踰꾩뿉 ���옣�맂 �뙆�씪 �씠由�
	        }

	        FileDAO dao = new FileDAO();
	        int result = dao.insertFile(dto);
	        dao.close();

	        if (result == 1) {  // 湲��벐湲� �꽦怨�
	            resp.sendRedirect("/Web_jsp/board/board.jsp");
	        }
	        else {  // 湲��벐湲� �떎�뙣
	        	resp.sendRedirect("/Web_jsp/board/board.jsp");
	        }
}
}
