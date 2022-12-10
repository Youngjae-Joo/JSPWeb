<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 태그를 혼자 쓸 거면 마지막에 /를 넣어주면 됨 -->
	<%--출력문 --%>
	<c:out value="${param.name }"/>
	
	<%--변수로 선언 --%>
	<c:set var="num" value="${param.age }"/>
	<c:out value="${num }"/>
	
	<hr/>
	<%--if문 --%>
	<%if(request.getParameter("name").equals("홍")){ %>
	
	<% }%>
	
	
	<c:if test="${param.name eq '홍'}">
		<h3>홍 입니다</h3>
	</c:if>
	
	<c:if test="${num >= 20 }">
		<h3>성인 입니다</h3>
	</c:if>
	<c:if test="${num < 20 }">
		<h3>미성년자 입니다</h3>
	</c:if>
	
	
	
	

</body>
</html>