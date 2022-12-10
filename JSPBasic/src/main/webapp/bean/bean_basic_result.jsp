<%@page import="com.example.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//user안에 있는 원자값들을 화면에 춢력
	User user=(User)request.getAttribute("user");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>bean_basic_result</h3>
	
	아이디:<%=user.getId() %><br>
	비밀번호:<%=user.getPw() %><br>
	이름:<%=user.getName() %><br>
	이메일:<%=user.getEmail() %><br>
	
</body>
</html>