package file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/edit.do")
public class EditController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp)
				throws ServletException,IOException{
			String id = req.getParameter("id");
			FileDAO dao = new FileDAO();
			FileDTO dto = dao.selectView(id);
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/board/Edit.jsp").forward(req, resp);
	
	}	
	protected void doPost(HttpServletRequest req,HttpServletResponse resp)
				throws ServletException,IOException{
		
		String saveDirectory = req.getServletContext().getRealPath("/fileSave");
		
		//ServletContext application = this.getServletContext();
		
		HttpSession session = req.getSession();
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, 500000);
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String id = mr.getParameter("idx");
		String content = mr.getParameter("content");
		String title = mr.getParameter("title");
		String name = (String)session.getAttribute("username");
		
		FileDTO dto = new FileDTO();
		dto.setContent(content);
		dto.setTitle(title);
		dto.setName(name);
		dto.setId(id);
		
		 String fileName = mr.getFilesystemName("ofile");
	        if (fileName != null) {
	            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            String newFileName = now + ext;

	            File oldFile = new File(saveDirectory + File.separator + fileName);
	            File newFile = new File(saveDirectory + File.separator + newFileName);
	            oldFile.renameTo(newFile);

	            dto.setOfile(fileName); 
	            dto.setSfile(newFileName);  

	            FileUtil.deleteFile(req, "/fileSave", prevSfile);
	        }else {
	        	dto.setOfile(prevOfile);
	        	dto.setSfile(prevSfile);
	        	}
	        FileDAO dao = new FileDAO();
	        int result = dao.updatePost(dto);
	        dao.close();
	        System.out.println(result);
	        if (result == 1) { 
	        	System.out.println(result);
	        	
	        	req.setAttribute("dto", dto);
				req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
	        }
}
	}
