package com.example.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.board.model.BoardVO;

public interface BoardService {
	
	public void regist(HttpServletRequest request, HttpServletResponse response);//등록
	ArrayList<BoardVO> getList(HttpServletRequest request, HttpServletResponse response);//조회
	//public 생략해도 public. vo는 한 행만 가져오겠다는 뜻. list에 vo를 담아서 가져와야 한다
	public BoardVO getContent(HttpServletRequest request, HttpServletResponse response);
	void update(HttpServletRequest request, HttpServletResponse response);
	int delete(HttpServletRequest request, HttpServletResponse response);
}
