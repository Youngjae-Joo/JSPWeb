package com.example.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.example.util.JDBCUtil;


public class BoardDAO {
	
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버클래스 로드에러");
		}
	}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public String UID = "jsp";
	public String UPW = "jsp";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//메서드
	public void regist(String writer, String title, String content) {
		
		String sql="insert into board values(board_seq.nextval,?,?,?,sysdate,0)";
		//String sql="insert into board(bno, writer, title, content, regdate, hit) values(board_seq.nextval,?,?,?)";
		
		try {
			conn=DriverManager.getConnection(URL,UID,UPW);
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,writer);
			pstmt.setString(2,title);
			pstmt.setString(3,content);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
	}
	
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql="select * from board order by bno desc";//최신글 순서대로
		
		try {
			conn=DriverManager.getConnection(URL, UID, UPW);
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//rs결과를 list에 저장
			while(rs.next()) {
				int bno2=Integer.parseInt(rs.getString("bno"));
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content = rs.getString("content");
				Timestamp date = rs.getTimestamp("regdate");
				int hit=Integer.parseInt(rs.getString("hit"));
				
				BoardVO vo = new BoardVO(bno2, writer, title, content, date, hit);
				list.add(vo);
				//반복문 맨 처음에 vo를 기본생성자로 생성하고 vo.setBno(rs.getInt("bno")) 방식으로 돌려도 된다
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public BoardVO getContent(String bno) {
		BoardVO vo = null;
		
		String sql="select * from board where bno=?";
		
		try {
			conn=DriverManager.getConnection(URL, UID, UPW);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			rs=pstmt.executeQuery();
			
		
			
			if(rs.next()) {
				vo=new BoardVO();
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setHit(rs.getInt("hit"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	public void update(String bno, String title, String content) {
		
		String sql="update board set title=?, content=? where bno=?";
		
		try {
			conn=DriverManager.getConnection(URL, UID, UPW);
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bno);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
	}
	
	public int delete(String bno) {
		int result=0;
		
		String sql="delete from board where bno=?";
		
		try {
			conn=DriverManager.getConnection(URL, UID, UPW);
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	
}
