<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//세션이 없다면 리다이렉트
	if(session.getAttribute("user_id")==null){
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out2 = response.getWriter();
		out2.println("<script>alert('로그인을 해주세요'); location.href='session_login.jsp';</script>");
		out2.flush();
		//response.sendRedirect("session_login.jsp");
		
	}

		
	String user_id=(String)session.getAttribute("user_id");
	String user_nick=(String)session.getAttribute("user_nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>"<%=user_id%>(<%=user_nick%>)님 환영합니다"</p>
	<a href="session_logout.jsp">로그아웃</a>
</body>
</html>