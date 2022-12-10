package com.example.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.board.model.BoardDAO;
import com.example.board.model.BoardVO;

public class BoardServiceImpl implements BoardService{

	public void regist(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//DAO 메서드 호출
		BoardDAO dao = BoardDAO.getInstance();
		dao.regist(writer, title, content);

	}

	
	public ArrayList<BoardVO> getList(HttpServletRequest request, HttpServletResponse response) {
			BoardDAO dao = BoardDAO.getInstance();
			ArrayList<BoardVO> list = dao.getList();
			
		return list;
	}


	public BoardVO getContent(HttpServletRequest request, HttpServletResponse response) {
		//a태그로 넘어오는 param
		String bno = request.getParameter("bno");
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardVO vo = dao.getContent(bno);
		
		//조회수 기능(중복방지 쿠키)
		
		return vo;
	}


	public void update(HttpServletRequest request, HttpServletResponse response) {
		
		//화면에서 넘어오는 값 writer는 안쓰니까 필요없다
		String bno=request.getParameter("bno");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.update(bno, title, content);
		
	}


	public int delete(HttpServletRequest request, HttpServletResponse response) {
		int result=0;
		String bno=request.getParameter("bno");
		BoardDAO dao = BoardDAO.getInstance();
		result = dao.delete(bno);
		
		return result;
		
	}
	
	
	
	
	
}
