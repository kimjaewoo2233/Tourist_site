<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			String saveDirectory = application.getRealPath("/fileSave");
			String saveFilename = request.getParameter("sName");
			String originalFilename = request.getParameter("oName");
			try{
				File file = new File(saveDirectory,saveFilename);
				InputStream inStream = new FileInputStream(file);
				
				String client = request.getHeader("User-Agent");
				if (client.indexOf("WOW64") == -1) {
			        originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
			    }
			    else {
			        originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
			    }
				 response.reset();
			    response.setContentType("application/octet-stream");
			    response.setHeader("Content-Disposition", 
			                       "attachment; filename=\"" + originalFilename + "\"");
			    response.setHeader("Content-Length", "" + file.length() );
			    
			    out.clear();  
			    
			    OutputStream outStream = response.getOutputStream();  
			    
			 // 출력 스트림에 파일 내용 출력
			    byte b[] = new byte[(int)file.length()];
			    int readBuffer = 0;    
			    while ( (readBuffer = inStream.read(b)) > 0 ) {
			        outStream.write(b, 0, readBuffer);
			    }
			    // 입/출력 스트림 닫음
			    inStream.close(); 
			    outStream.close();
			}catch (FileNotFoundException e) {
				out.println("<script>location.href=''</script>");
			}
			catch (Exception e) {
				out.println("<script>location.href=''</script>");
			}
		%>
		잘넘오옴

</body>
</html>