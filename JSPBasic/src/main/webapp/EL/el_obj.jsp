<%@page import="com.example.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User vo = new User();
	vo.setId("hhh123");
	vo.setName("홍길숙");
	vo.setEmail("hhh@naver.com");
	
	request.setAttribute("vo", vo); //리퀘스트에 강제 저장

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	아이디: ${requestScope.vo.id }<br>
	이름: ${requestScope.vo.name }<br>
	이메일: ${requestScope.vo.email }<br>
	<hr>
	<!-- 
		requestScope는 생략을 하고 많이 사용합니다
		사용되는 순서 = request > session > application. 이름이 같으면 생명주기가 짧은거부터 실행. 그래서 request말고 다른건 ~~Scope를 붙이는게 편함
	 -->
	 
	${vo.id}<br>
	${vo.name}<br>
	${vo.email}<br>
	
	
</body>
</html>