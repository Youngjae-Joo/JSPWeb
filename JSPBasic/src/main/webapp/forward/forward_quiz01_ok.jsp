<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String avg = (String)request.getAttribute("avg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성공페이지</h2>
	성공! <%=name%>이는 성공<br>  
	평균:<%=avg %>
</body>
</html>