<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="file.*" %>
 
<%
	String realFolder = "";
 
	String saveFolder = "/fileSave"; // out폴더에 fileSave 폴더 생성
	String encType = "utf-8";
	int maxSize = 5*1024*1024; // 최대 업로드 5mb
 
	realFolder = application.getRealPath(saveFolder);
	out.println("the realpath is: " + realFolder + "<br>");
 
	try {
	    MultipartRequest multi = null;
 
	    multi = new MultipartRequest(request, realFolder, maxSize, encType);
		
	    String fileName = multi.getFilesystemName("uploadFile");
	    String ext = fileName.substring(fileName.lastIndexOf("."));	//파일확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	    String newFileName = now + ext;
	    
	    
	    File oldFile = new File(realFolder+File.separator+fileName);
	    File newFile = new File(realFolder+File.separator+newFileName);
	    oldFile.renameTo(newFile);
	    
	    String title = multi.getParameter("title");
	    String name = (String)session.getAttribute("username");
	    //이;름 만ㄷ르어야ㅗ함
	    String content = multi.getParameter("content");
	    
	    
	    
	    
	    FileDTO dto = new FileDTO();
	    dto.setTitle(title);
	    dto.setName(name);
	    dto.setContent(content);
	    
	    dto.setOfile(fileName);
	    dto.setSfile(newFileName);
	    
	    FileDAO dao = new FileDAO();
	    dao.insertFile(dto);
	    dao.close();
	    
	    response.sendRedirect("/Web_jsp/board/board.jsp");
 
	}catch (IOException ioe) {
		System.out.println(ioe);
	} catch (Exception ex) {
		System.out.println(ex);
		 response.sendRedirect("/Web_jsp/board/board.jsp");
	}
%>