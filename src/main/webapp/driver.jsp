<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.util.List" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>JDBC드라이버 테스트 </h2>

<%
UserTestDAO dao = new UserTestDAO();
		List<UserTestDTO> users = dao.selectList();
		for(UserTestDTO user : users){
	out.print(user.getName());
		}
%>
