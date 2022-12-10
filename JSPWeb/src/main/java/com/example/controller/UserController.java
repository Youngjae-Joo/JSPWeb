package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.user.model.UserVO;
import com.example.user.service.UserService;
import com.example.user.service.UserServiceImpl;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	
	}
	
	//get, post 하나로 묶음
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		//요청분기
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command =uri.substring(path.length());
		
		
		//서비스 영역
		UserService service=new UserServiceImpl();
		
		
		
		switch (command) {
		case "/user/user_join.user":
			
			request.getRequestDispatcher("user_join.jsp").forward(request, response);
			
			break;
		case "/user/joinForm.user"://회원가입기능
			
			int result = service.join(request, response);
			
			if(result>=1) {//중복
				//메시지
				request.setAttribute("msg", "중복된 아이디 or email입니다");
				request.getRequestDispatcher("user_join.jsp").forward(request, response);
				
			}else {//가입성공
				//가지고나갈 데이터 없음. redirect
				//response.sendRedirect("user_login.jsp");-그런데 이대로 하면 페이지 주소가 user_login.jsp로 남음. MVC2는 컨트롤러를 타고 가야 함
				response.sendRedirect("user_login.user");//이렇게하면 컨트롤러가 이걸 받아오고, 그래서 세번째 case로 이동하고 튀어나간다.
				//MVC2에서 리타이렉트는 다시 컨트롤러를 태우는 요청
			}
			
			break;
			
		case"/user/user_login.user"://로그인페이지
			
				request.getRequestDispatcher("user_login.jsp").forward(request, response);
			break;
			
		case"/user/loginForm.user"://로그인요청
				UserVO vo = service.login(request, response);
				if(vo==null) {//로그인실패
					request.setAttribute("msg", "아이디 비밀번호를 확인하세요");
					request.getRequestDispatcher("user_login.jsp").forward(request, response);
				}else {//로그인성공
					//마이페이지
					response.sendRedirect("user_mypage.user");
				}
				
			break;
			
		case"/user/user_mypage.user": //마이페이지
				request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
			break;
			
		case"/user/user_logout.user": //로그아웃
			HttpSession session=request.getSession();
			session.invalidate();//세션무효화
			
			//response.sendRedirect("/JSPWeb/index.main");//메인으로
			response.sendRedirect(path+"/index.main");
			
			break;
		case"/user/user_modify.user"://정보수정화면 
			/****회원데이터를 가지고 나오는 작업 ****
			 * service와 dao에 getInfo() 메서드를 선언합니다.
			 * service에서는 세션에서 아이디를 얻습니다
			 * dao에서는 id를 전달받아 회원 데이터를 조회하여 vo에 저장합니다
			 * controller에서는 조회한 vo를 저장하고 화면으로 가지고 나갑니다.
			 * 화면에서는 input태그에 값을 출력해주세요
			 */
			UserVO vo2 = service.getInfo(request, response);
			//1회용으로 쓸거임. 수정하기 전에 보여주기만 할 것.
			request.setAttribute("vo", vo2);
			
			request.getRequestDispatcher("user_modify.jsp").forward(request, response);
			
			
			break;
			
		case"/user/updateForm.user":
			/*
			 ****회원정보를 업데이트 하는 작업****
			 *service와 dao에 update() 메서드를 생성
			 *service에선 필요한 파라미터 값을 받습니다(pw, name, gender) 조건절에 id
			 *dao에서 데이터를 전달받아서 업데이트를 실행
			 *업데이트 이후에는 컨트롤러를 태워서 mypage로 리다이렉트
			 */
			int result2 = service.update(request, response);
			if(result2==1) {//업데이트 성공
				//response.sendRedirect("user_mypage.user");
				
				//out객체를 이용해서 화면에 스크립트를 작성해서 보냄
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('정보가 수정되었습니다')");
				out.println("location.href='user_mypage.user';");
				out.println("</script>");
			}else {//업데이트 실패
				//modify화면으로 포워드-데이터를 가지고 나갈 수가 없다. 때문에 컨트롤러를 타는 것
				response.sendRedirect("user_modify.user");
			}
			break;
			
		case "/user/user_delete.user":
			//삭제는 실패가 일어나지 않아서 메서드 반환 타입을 void로 하고 메서드 호출과 페이지이동만 해도 된다.
				int result3 = service.delete(request, response);
				
				if(result3==1) {//삭제성공
					response.sendRedirect(path+"/index.main");//메인화면
				}else {
					response.sendRedirect("user_mypage.user");//마이페이지
				}
			break;
			

		default:
			break;
		}
		
		
	}
	
	

}
