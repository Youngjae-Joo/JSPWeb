<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   //화면에서 쓸 변수가 있으면 상단부에 선언
   int a=10;
 	String str = "hello world";
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
	CTRL SHIFT / 
	<%
		out.println(a+"<br>");
		out.println(str+"<br>");
	%>
	<%= a %> <br>
	<%= str %> <br>
	 --%>

	<!-- 
	 html 주석
	  -->

	<hr>
	<h2>구구단 3단을 표현식을 통해서 출력</h2>
	<%for(int i=1;i<=9;i++){%>
	3 x
	<%=i%>
	=
	<%=3*i%><br>
	<%} %>

	<hr>
	<h2>반복문으로 체크박스에 1~20까지 이름을 붙여서 가로 출력</h2>
	<%for(int i=1;i<=20;i++){%>
	<input type="checkbox" name="cbox">
	<%= i%>번
	<%} %>

	<hr>
	<h2>구구단</h2>
	<form>
		<table border="1">
			<tr>
				<%for(int k=2;k<=9;k++) {%>
				<td colspan="1" align="center"><%=k %>단</td>
				<%} %>
			</tr>

			<%for(int i=1;i<=9;i++){%>
			<tr>
				<%for(int j=2;j<=9;j++){ %>
				<td><%=j %>x<%=i %>=<%=i*j%> <%} %> <%}%></td>
			</tr>
		</table>
	</form>


</body>
</html>