package com.example.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainController
 */
@WebServlet("*.main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command =uri.substring(path.length());
		
		
		//main화면
		//and
		//member화면
		
		switch (command) {
		case "/index.main":
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			break;
		case "/member/member.main":
			
			request.getRequestDispatcher("member.jsp").forward(request, response);
			
			break;
		

		default:
			break;
		}
		
		
	}

}
