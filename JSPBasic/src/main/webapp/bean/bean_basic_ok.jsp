<%@page import="com.example.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8"); //한글처리
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	//데이터베이스로...
	//단순히 값이 적으면 그냥 사용해도 되지만, 값이많으면 자바빈(객체) 사용함
	
	/*1st
	User user = new User();
	user.setId(id);
	user.setPw(pw);
	user.setName(name);
	user.setEmail(email);
	*/
	
	//2nd
	User user = new User(id, pw, name, email);
	request.setAttribute("user", user); //3번페이지에서 활용
	request.getRequestDispatcher("bean_basic_result.jsp").forward(request, response);//포워딩
	
%>
