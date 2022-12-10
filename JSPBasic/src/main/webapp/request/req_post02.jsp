<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");//post 한글처리. 반드시 맨 위에


   	String id=request.getParameter("id");
   	String email=request.getParameter("email");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id%><br>
	<%=email%>
</body>
</html>