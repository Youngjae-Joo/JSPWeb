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

	<h3>1~100까지 홀수 합</h3>
	<%
	int sum=0;
	for(int i=1;i<=100;i+=2){
		sum=sum+i;
	}
	%>
	결과:<%=sum%>
	<hr/>
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="2" >
		<c:set var="sum" value="${sum+i}"/>
	</c:forEach>	
	결과 : ${sum }
	
	<hr/>
	<h3>2~9단까지 구구단 세로로 출력(jstl)</h3>
	<%--step 생략시 자동으로 1 --%>
	<c:forEach var="i" begin="2" end="9">
		<c:forEach var="j" begin="1" end="9">
			
		${i } ${' x ' } ${j } ${' = ' } ${i*j }<br>
		</c:forEach>
		<br>
	</c:forEach>
	
	<hr>
	<h3>향상된 포문</h3>
	<%
		int[] arr =new int[] {1,2,3,4,5};
		for(int a : arr){
			out.println(a);
		}
	%>
	<br>
	<c:set var="arr" value="<%=new int[] {1,2,3,4,5}%>"/>
	
	<c:forEach var="a" items="${arr }" varStatus="s">
		인덱스번호: ${s.index }<br>
		순서:${s.count }<br>
		값:${a }<br>
	</c:forEach>
	
	
	
</body>
</html>