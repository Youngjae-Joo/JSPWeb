<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>path_ex01</h2>
	<!-- 
	절대경로: 프로젝트의 전체경로(IP주소, port번호를 제외한 /컨텍스트경로부터 시작)
	경로가 /로 시작한다는 것은 절대경로를 의미함. http로 시작하는 전체경로를 다 적어도 되고
	/컨텍스트패스부터 시작하는 경로를 적어도 됨.
	
	상대경로: 현재위치에서 다른파일의 경로를 참조
	내 위치에서 프로젝트에 위치한 다른 파일을 찾아가는 것
	 -->
	 
	 <a href="path_ex02.jsp">ex02(상대)</a>
	 <a href="http://localhost:8181/JSPBasic/path/path_ex02.jsp">ex02(절대1)</a>
	 <a href="/JSPBasic/path/path_ex02.jsp">ex02(절대2)</a> 
	 
	
</body>
</html>