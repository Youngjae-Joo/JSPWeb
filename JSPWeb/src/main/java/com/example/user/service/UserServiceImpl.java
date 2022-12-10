package com.example.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.user.model.UserDAO;
import com.example.user.model.UserVO;

public class UserServiceImpl implements UserService{
	//컨트롤러의 역할을 분담
	
	//가입처리
	public int join(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		//아이디 or email 중복 검사 -> 가입
		UserDAO dao=UserDAO.getInstance();
		int result=dao.idCheck(id, email);
		
		if(result>=1) {//중복
			return 1;//중복의 의미반환
		}else {//중복x->가입
			UserVO vo = new UserVO(id, pw, name, email, gender);
			dao.join(vo);
			return 0;//성공의 의미반환
		}
		
		
		
	}
	
	//로그인
	public UserVO login(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		UserVO vo = dao.login(id, pw);
		
		if(vo!=null){
		HttpSession session = request.getSession();//자바에서 현재 세션 사용
		//세션에 아이디, 이름을 저장
		session.setAttribute("user_id", vo.getId());
		session.setAttribute("user_name", vo.getName());
		}
		return vo;
	}

	//값 받아오기
	public UserVO getInfo(HttpServletRequest request, HttpServletResponse response) {
		//세션에서 user_id값을 얻음
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");//컨트롤러 로그인메서드에 있는 setAttribute의 키값
		
		UserDAO dao = UserDAO.getInstance();//DAO는 특별하게 생성한다. new UserDAO()가 아님
		UserVO vo = dao.getInfo(id);
		
		return vo;
		
	}

	//업데이트
	public int update(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		
		//DAO객체 생성
		UserDAO dao=UserDAO.getInstance();
		int result = dao.update(id, pw, name, gender);
		
		//업데이트 성공시 세션 변경
		if(result==1) {//세션을 바꾸는건 서비스에서!
			HttpSession session = request.getSession();
			session.setAttribute("user_name", name);
		}
		
		return result;
	}
	
	
	

	//회원탈퇴
	public int delete(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		//id가 필요
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		UserDAO dao3=UserDAO.getInstance();
		result = dao3.delete(id);
		
		if(result==1) {
			session.invalidate();
		}
		
		return result;
	}
	
	
	
	
	

}
