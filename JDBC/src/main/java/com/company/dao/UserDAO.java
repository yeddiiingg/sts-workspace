package com.company.dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.company.mydb.ConnectionPool;

public class UserDAO {
	// 로그인 기능을 가진 메서드 작성
	public int login(String uid, String upw) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.get();
			String sql = "SELECT id,password FROM user WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(!rs.next()) return 1;
			if(!upw.equals(rs.getString("password"))) return 2;
			return 0;
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public void join(String join_id, String join_pw1, String join_name) throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.sql.Timestamp ts= null;
		try {
			conn = ConnectionPool.get();
			String sql = "INSERT INTO user VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, join_id);
			pstmt.setString(2, join_pw1);
			pstmt.setString(3, join_name);
			pstmt.setTimestamp(4, ts);
			pstmt.executeUpdate();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
