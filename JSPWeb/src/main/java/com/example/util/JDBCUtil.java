package com.example.util;

import java.sql.*;

public class JDBCUtil {
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn !=null) conn.close();//open이 되어 있으면 닫는다
			if(pstmt !=null) pstmt.close();
			if(rs !=null) rs.close();
		} catch (Exception e2) {
			System.out.println("close에러");
		}
	}
}
