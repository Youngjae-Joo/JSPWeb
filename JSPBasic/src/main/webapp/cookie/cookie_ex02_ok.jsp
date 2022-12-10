<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	String idCheck=request.getParameter("idCheck");
	

	//로그인 성공이라 가정
	if(id.equals("aaa123")&&pw.equals("1234")){
		
		//로그인 성공시 id쿠키생성 
		Cookie cookie = new Cookie("user_id",id);
		cookie.setMaxAge(1800);
		response.addCookie(cookie);
		
		//idCheck쿠키
		//사용자가 체크박스를 체크했다면 idcheck쿠키 생성. 시간은 30초
		if(idCheck!=null){//null은 string이 아니기 때문에 비교가 불가. nullpointexception이 발생한다.
			Cookie idcheck = new Cookie("idc",id);
			idcheck.setMaxAge(30);
			response.addCookie(idcheck);
		}else{
			//체크가 되어있지 않다면 쿠키를 지우기
			Cookie idcheck = new Cookie("idc",id);
			idcheck.setMaxAge(0);
			response.addCookie(idcheck);
		}
		response.sendRedirect("cookie_ex02_welcome.jsp");//성공페이지
		
		//로그인 실패시
	}else{
		if(idCheck!=null){
			Cookie idcheck = new Cookie("idc",id);
			idcheck.setMaxAge(30);
			response.addCookie(idcheck);
		}else{
			Cookie idcheck = new Cookie("idc",id);
			idcheck.setMaxAge(0);
			response.addCookie(idcheck);
		}
		response.sendRedirect("cookie_ex02.jsp");//다시 로그인 화면으로	
	}
%>
