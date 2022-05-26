<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="file.*" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
    <a href="FileUploadMain.jsp">파일 등록하기</a>
    <%
    FileDAO dao = new FileDAO();
    List<FileDTO> fileLists = dao.myFileList();
    dao.close();
    %>
    <table border="1">
        <tr>
            <th>No</th><th>제목</th>
            <th>원본 파일명</th><th>저장된 파일명</th><th>작성일</th><th></th>
        </tr>
    <% for (FileDTO f : fileLists) { %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getTitle() %></td>
            <td><%= f.getOfile() %></td>
            <td><%= f.getSfile() %></td>
            <td><%= f.getDateCreated()%></td>
            <td><a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(),"UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8") %>">[다운로드]</a></td>
        </tr>
    <% } %>
    </table>    
</body>
</html>