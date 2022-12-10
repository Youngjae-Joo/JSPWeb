<%@page import="com.example.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<section>
	<div align="center">
	<h3>회원정보 수정 연습</h3>
		<form action="updateForm.user" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="${vo.id }"
						pattern="\w{4,8}" required readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder="4~8글자 영문자숫자"
						pattern="\w{4,8}" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" pattern="[가-힣]{3,}"
						required="required" value="${vo.name }"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" required="required" value="${vo.email }" readonly></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="f" ${vo.gender eq 'f'?'checked':''}>여자 
						<input type="radio" name="gender" value="m" ${vo.gender eq 'm'?'checked="checked"':''}>남자
					</td>
				</tr>
			</table>
			<input type="submit" value="정보수정">
			<!-- 
					JS로 기능을 붙임 
					onclick="location.href='경로'"
					-->
			<input type="button" value="마이페이지로 가기" onclick="location.href='user_mypage.user'">
		</form>
	</div>
</section>

<%@include file="../include/footer.jsp" %>