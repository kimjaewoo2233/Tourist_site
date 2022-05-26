<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
<style>
    table{
                position: relative;
                top: 45%;
                left: 15%;
                width: 1100px;
                border-collapse: collapse;
            }
            .w-btn-neon2 {
                    position: relative;
                    margin-top: 100px;
                    margin-left:20px;
                    border: none;
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
                    display:inline-block;
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
            textarea{
            	height:90%;
            	width:90%;
            }
            h2{
            	width:300px;
            	margin:0 auto;
            	margin-top:35px;
            	margin-bottom:35px;
            	
            	
            }
            
            </style>
</head>
<body>

<h2>회원제 게시판 - 글쓰기</h2>

	<form name="writeFrm" method="post" action="/Web_jsp/edit.do"  enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${ dto.getId() }"/>
		<input type="hidden" name="prevOfile" value="${ dto.getOfile() }" />
		<input type="hidden" name="prevSfile" value="${ dto.getSfile() }" />
	    <table >
        <tr>
            <td>제목</td>
            <td colspan="2" width="70%">
            
                <input type="text" name="title" style="width:500px" value="${ dto.getTitle() }"/>
            </td>
            <td>
            <div name="name">
            &nbsp&nbsp&nbsp작성자:&nbsp&nbsp&nbsp<%= session.getAttribute("username")%>
            </div>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td height="400" colspan="2">
                <textarea  name="content">${ dto.getContent() }</textarea>
            </td>
            <td>
            	${ dto.getOfile() }
            	<input type="file" name="ofile"/>
            </td>
        </tr>
        <tr style="width=100%;" >
            <td colspan="4" align="center">
                <button class="w-btn-neon2" type="submit">작성 완료</button>
                <button class="w-btn-neon2" type="reset">다시 입력</button>
                <button class="w-btn-neon2" type="button" onclick="location.href='/Web_jsp/board.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>