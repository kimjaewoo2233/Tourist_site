<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="file.*" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script>
    	window.onload = function(){
    		document.body.style.opacity='1';
    	}
    	
  		var username = '<%= session.getAttribute("username") %>';
  		console.log(username);
  		if(username == 'null'){
  			location.href = '../login.jsp';
  		}
    </script>
    <style>
    		body{
    			opacity:0;
    			transition:2s;
    		}
            table{
           		margin-top:200px;
                position: relative;
                top: 45%;
                left: 15%;
                width: 1100px;
                border-collapse: collapse;
            }
            .w-btn-neon2 {
                    position: relative;
                    margin-top: 100px;
                    border: none;
                    margin-left:40px;
                    min-width: 120px;
                    min-height: 40px;
                    background: linear-gradient(
                        90deg,
                        rgba(129, 230, 217, 1) 0%,
                        rgba(79, 209, 197, 1) 100%
                    );
                    border-radius: 1000px;
                    color: darkslategray;
                    cursor: pointer;
                    box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
                    font-weight: 700;
                    transition: 0.3s;
            }   
            .w-btn-neon2:hover {
                transform: scale(1.2);
            }

            .w-btn-neon2:hover::after {
                content: "";
                width: 30px;
                height: 30px;
                border-radius: 100%;
                border: 6px solid #00ffcb;
                position: absolute;
                z-index: -1;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                animation: ring 1.5s infinite;
            }
            td{
            text-align:center;}
            a{
            	text-decoration: none;
            }
    </style>
</head>
<body>
	<%
		FileDAO dao = new FileDAO();
		List<FileDTO> list = dao.myFileList();
		
	%>
    <table border="1">
        <caption>우리들에 이야기</caption>
        <tr>
          <th style="width: 4%;">번호</th>
          <th style="width: 6%;">작성자</th>
          <th style="width: 50%;">제목</th>
          <th style="width: 6%;">등록일</th>
          <th style="width: 8%;">자료</th>
        </tr>
    <% for (FileDTO f : list) { %>
        <tr>
            <td><%= f.getId() %></td>
            <td><%= f.getName() %></td>
            <td style="text-align: center"><a href="/Web_jsp/view.do?id=<%= f.getId()%>"><%= f.getTitle() %></a></td>
            <td><%= f.getDateCreated().substring(0,10)%></td>
            <td><a href="/Web_jsp/fileAdmin/Download.jsp?oName=${f.getOfile() }&sName=${f.getSfile() }">
            <% if(f.getOfile() != null) out.print(f.getOfile()); %></a></td>
        </tr>
    <% } %>
    </table>   
	 <button style="margin-left:70%" class="w-btn-neon2" type="button" onclick="location.href='write.jsp'">
            글쓰기
    </button>
      <button class="w-btn-neon2" type="button" onclick="location.href='../index.jsp'">
            돌아가기
    </button>
</body>
</html>