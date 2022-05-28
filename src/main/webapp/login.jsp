<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<style>
	body{
		margin-top:100px;
		background-image:url(/Web_jsp/images/main.png);
		background-repeat: no-repeat;
		background-size:1550px 1000px;
	}
	.form-signin-heading{
		color: lavenderblush;
	}
	
	div, .btn-block{
	width:50%;
	}
</style>
</head>
<body>
<%
		String found = request.getParameter("found");
		try{
			if(found.equalsIgnoreCase("not")){
				out.println("<script>alert('없는 정보입니다')</script>");
				found=null;
			}else if(found.equalsIgnoreCase("sus")){
				out.println("<script>alert('가입성공! 로그인을 해주세요')</script>");
				found=null;
			}
		}catch(Exception e){
			
		}
		
	%>
<div class="container" align="center">
	
	<h3 class="form-signin-heading">로그인</h3>
		<form class="form-signin" action="/Web_jsp/login" method="post">
			<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="id" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				
				<input type="password" name="pass" class="form-control" placeholder="Password" required>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			<button class="btn btn-lg btn-secondary btn-block" type="button" onclick="location.href='addUser.jsp'">회원가입</button>
		</form>
</div>
</body>
</html>