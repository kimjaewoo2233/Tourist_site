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
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, 180000);
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
	            // 첨부 파일이 있을 경우 파일명 변경
	            // 새로운 파일명 생성
	            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            String newFileName = now + ext;

	            // 파일명 변경
	            File oldFile = new File(saveDirectory + File.separator + fileName);
	            File newFile = new File(saveDirectory + File.separator + newFileName);
	            oldFile.renameTo(newFile);

	            // DTO에 저장
	            dto.setOfile(fileName);  // 원래 파일 이름
	            dto.setSfile(newFileName);  // 서버에 저장된 파일 이름

	            // 기존 파일 삭제
	            FileUtil.deleteFile(req, "/fileSave", prevSfile);
	        }else {
	        	dto.setOfile(prevOfile);
	        	dto.setSfile(prevSfile);
	        	}
	        FileDAO dao = new FileDAO();
	        int result = dao.updatePost(dto);
	        dao.close();
	        System.out.println(result);
	        if (result == 1) {  // 수정 성공
	        	System.out.println(result);
	        	
	        	req.setAttribute("dto", dto);
				req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
	        }
}
	}
