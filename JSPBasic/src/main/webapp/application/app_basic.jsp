<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	application은 session과 사용방법은 거의 동일하며
	생명주기가 톰캣을 stop할때 까지 1개 유지가 된다.
	*/
	
	int total=0;
	
	if(application.getAttribute("total")!=null){
		total=(int)application.getAttribute("total");//무슨 뜻? total값의 누적. 새로고침할 때마다 값이 증가한다. 브라우저를 꺼도 증가값이 유지된다.
	}
	
	total++;
	
	application.setAttribute("total", total);//저장
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="app_basic_ok.jsp">total값 확인</a>
	app에 유지되는 total 값 : <%=total%> 
</body>
</html>