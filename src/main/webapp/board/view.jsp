<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
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
		.btn{
			margin:0 auto;
			width:508px;
		}
</style>
  <script>
    		var username = '<%= session.getAttribute("username") %>';
    		console.log(username);
    		if(username == 'null'){
    			location.href = 'login.jsp';
    		}
    </script>
</head>
<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- ????????? ?????? -->
    <tr>
        <td>??????</td> <td>${ dto.getId() }</td>
        <td>?????????</td> <td>${ dto.getName() }</td>
    </tr>
    <tr>
        <td>?????????</td> <td>${ dto.getDateCreated() }</td>
    </tr>
    <tr>
        <td>??????</td>
        <td colspan="3">${ dto.getTitle() }</td>
    </tr>
    <tr>
        <td>??????</td>
        <td colspan="3" height="100">${ dto.getContent() }</td>
    </tr>

    <!-- ???????????? -->
    <tr>
        <td>????????????</td>
        <td>
          <a href="/Web_jsp/download.do?ofile=${ dto.getOfile() }&sfile=${ dto.getSfile() }">
               ${ dto.getOfile() }
            </a>
        </td>
    </tr>

    <!-- ?????? ??????(??????) -->
 
</table>
  		<div class="btn">
  			<button class="w-btn-neon2" type="button" onclick="location.href='/Web_jsp/pass.do?mode=edit&id=${ dto.getId() }';">
                ????????????
            </button>
            <button class="w-btn-neon2" type="button" onclick="location.href='/Web_jsp/pass.do?mode=delete&id=${ dto.getId() }';">
                ????????????
            </button>
            <button  class="w-btn-neon2" type="button" onclick="location.href='/Web_jsp/board/board.jsp';">
                ?????? ????????????
            </button>
         </div>
</body>
</html>