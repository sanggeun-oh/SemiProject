package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlConnect {
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://semiproject.cwtgyuascams.ap-northeast-2.rds.amazonaws.com:3306/semiproject";
	String id = "admin";
	String pass = "12345678";
	
	public MysqlConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Mysql 드라이버 오류 : " + e.getMessage());
		}
	}
	
	// mysql 연결
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, id, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("컴퓨터 mysql 연결 실패 : " + e.getMessage());
		}
		
		return conn;
	}
	
	public void dbClose(Connection conn, Statement stmt) {
		try {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			
		}
	}
	
	public void dbClose(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			
		}
	}
	
	public void dbClose(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			
		}
	}
	
	public void dbClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			
		}
	}
}
