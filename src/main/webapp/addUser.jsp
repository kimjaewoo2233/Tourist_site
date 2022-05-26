<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<style>
	body{
		margin-top:100px
	}
	div, .btn-block{
	width:50%;
	}
	</style>
</head>
<body>
	<%
		try{
			String found = request.getParameter("found");
			if(found.equalsIgnoreCase("not")){
				out.println("<script>alert('잘못된 접근입니다.')</script>");
			}else if(found.equalsIgnoreCase("overlap")){
				out.println("<script>alert('이미 등록된 이메일이니다. 다른 이메일을 사용해주세요')</script>");
			}	
		}catch(Exception e){
		}
		
	%>
<div class="container" align="center">
	
	<h3 class="form-signin-heading">Please sign in</h3>
		<form class="form-signin" action="/Web_jsp/register" method="post">
			<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="username" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				
				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
				<div class="form-group">
				<label class="sr-only">email</label>
				
				<input type="text" name="email" class="form-control" placeholder="email" required>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">입력완료</button>
			
		</form>
</div>
</body>
</html>