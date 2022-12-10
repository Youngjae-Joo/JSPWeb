<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>path_ex03</h2>
	
	<a href="../path_ex01.jsp">ex01(상대)</a><!--  ../는 한단계 위로 올라간다는 뜻 -->
	<a href="/JSPBasic/path/path_ex01.jsp">ex01(절대)</a>
	
	<hr>
	<!-- a태그를 이용해서 session_login페이지로 상대경로, 절대경로로 이동  -->
	<a href="../../session/session_login.jsp">session_login(상대)</a>
	<a href="/JSPBasic/session/session_login.jsp">session_login(절대)</a>
	<br>
	<hr>
	<!-- a태그를 이용해서 TestServlet으로 상대경로, 절대경로로 이동 -->
	<a href="../..//banana">TestServlet(상대)</a>
	<a href="/JSPBasic/banana">TestServlet(절대)</a><!--어노테이션을 넣으면 바로 실행됨.-->
	<br>
	<hr>
	<!-- img태그를 이용해서 HTML폴더안에 1.jpg과 2.jpg 참조 -->
	이미지 절대:<br>
	<img alt="제목" src="/JSPBasic/HTML/1.jpg"><br> <!-- alt는 이미지가 뜨지 않으면 대신 뜨는 것. alternative -->
	이미지 상대:<br>
	<img alt="제목" src="../../HTML/2.jpg" width="200px" height="200px">
	
</body>
</html>