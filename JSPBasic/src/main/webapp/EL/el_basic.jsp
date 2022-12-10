<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL태그는 표현식을 대체합니다</h2>

	${1 + 2}<br>
	${1 > 2}<br/>
	${1 ==2 }<br/>
	${1 ==2 ? '같음' : '다름'}<br/>
	
	${1<2|| 1>2}<br/>
	${1<2 or 1>2}<br>
	
	${1<2 && 1>2 }<br>
	${1<2 and 1>2 }<br/>
	
	${'홍길동 == '홍길동} <br/>
	${'홍길동' eq '홍길동' }<br>
	
	${!false }<br>
	${not false}<br>
	
	<!-- 
		< ,lt (little than )
		<= le(little or equals)
		> gt(greater than)
		>= ge(greater or equals)
	처럼 표현할수도 있으나, 왼쪽게 낫다
	 -->	

	
</body>
</html>