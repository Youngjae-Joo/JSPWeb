<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style>
		.container {
			display:flex; 
			height: 100vh;
			background-color:lightblue;
			justify-content:center;
			align-items:center; 
		}
		
		#wrap{
			border:1px solid #777;
			background-color:#ffffff;
			padding: 10px;
			text-align:center;
		}
		
	</style>
	
</head>
<body>

	<!-- 
	태그의 class 속성-태그를 식별하는 이름(중복가능)
	주로 디자인을 적용하는데 사용
	선택자 : class는 .으로 나타내고, id는 #으로 지칭해서 나타냄
	
	태그의 id - 고유하게 식별하는 이름(화면에서 중복이 있으면 안됨)
	 -->

	<div class="container">
		<form action="res_ex02_result.jsp" method="post" id="wrap">
			<h3>로그인연습</h3>		
			<input type="text" name="id" placeholder="아이디"><br>
			<input type="password" name="password" placeholder="비밀번호"><br>
			
			<input type="submit" value="로그인">
		</form>
	</div>

</body>
</html>