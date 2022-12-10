<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		태그에 필요한 속성을 지정하고 post방식으로 전달하고, 
		ok페이지에는 사용자가 입력한 값을 출력
	 --%>




	<form action="req_quiz_ok.jsp" method="post">
		<h3>입력양식</h3>
		아이디:<input type="text" placeholder="힌트:8글자" maxlength="8" size="10" name="id"><br>
		비밀번호:<input type="password" placeholder="힌트:알면뭐하게" size="10" name="pw"><br>
		
		<!-- checkbox, radio속성은 반드시 name속성을 통일 시켜서 하나의 그룹으로 묶습니다 -->
		관심분야:
		<input type="checkbox" name="inter" value="java">JAVA
		<input type="checkbox" name="inter" value="jsp">JSP
		<input type="checkbox" name="inter" value="js">JS
		<input type="checkbox" name="inter" value="html">HTML
		<input type="checkbox" name="inter" value="oracle">ORACLE
		<br>
		
		전공분야:
		<input type="radio" name="major" value="e">경영
		<input type="radio" name="major" value="c">컴퓨터
		<input type="radio" name="major" value="m">수학
		<input type="radio" name="major" value="ma">기계공학
		
		<br>
		지역:
		<select name="region">
			<option value="s">서울</option>
			<option value="k">경기</option>
			<option value="b">부산</option>
			<option value="i">인천</option>
		</select>
		
		<br>
		정보입력:<br>
		<textarea rows="5" cols="30" name="info"></textarea>
		
		
		<br>
		<!-- form태그의 데이터를 서버로 전송하는 역할 -->
		<input type="submit" value="확인">
		<input type="reset" value="폼초기화">
		
	</form>

</body>
</html>