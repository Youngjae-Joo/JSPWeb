<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//쿠키삭제-쿠키는 삭제가 없어서 동일이름의 쿠키의 시간을 0초로 만들어서 삭제
 	Cookie idCookie = new Cookie("user_id","kkk123");
 	idCookie.setMaxAge(0);
 	response.addCookie(idCookie);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키삭제</h3>
</body>
</html>