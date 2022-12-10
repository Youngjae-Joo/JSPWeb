<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  	//쿠키 확인하기
  	//브라우저에 쿠키는 request객체에 자동으로 넘어와서 저장됩니다.(만료되기 전까지 어디서든 사용가능)
  	Cookie[] cookies =request.getCookies();
  	
  	//쿠키가 없으면 null이기때문에 에러가 발생
  	if(cookies!=null){
  		
  		for(Cookie c : cookies){
  			out.println(c.getName()+"<br>");
  			out.println(c.getValue()+"<br>");
  		}
  		
  	}
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 사용하기</h3>
	
	<a href="cookie_ex01_reset.jsp">쿠키삭제</a>
	

</body>
</html>