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
				out.println("<script>alert('���� �����Դϴ�')</script>");
				found=null;
			}else if(found.equalsIgnoreCase("sus")){
				out.println("<script>alert('���Լ���! �α����� ���ּ���')</script>");
				found=null;
			}
		}catch(Exception e){
			
		}
		
	%>
<div class="container" align="center">
	
	<h3 class="form-signin-heading">�α���</h3>
		<form class="form-signin" action="/Web_jsp/login" method="post">
			<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="id" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				
				<input type="password" name="pass" class="form-control" placeholder="Password" required>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">�α���</button>
			<button class="btn btn-lg btn-secondary btn-block" type="button" onclick="location.href='addUser.jsp'">ȸ������</button>
		</form>
</div>
</body>
</html>