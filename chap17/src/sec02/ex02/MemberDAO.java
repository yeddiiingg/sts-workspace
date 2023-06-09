package sec02.ex02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.NamingException;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	public List<MemberVO> listMembers() throws SQLException, NamingException{
		List<MemberVO>membersList = new ArrayList<>();
		try {
			con = ConnectionPool.get();
			String query ="SELECT * FROM t_member ORDER BY joinDate DESC";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberVO memberVO = new MemberVO(id,pwd,name,email,joinDate);
				membersList.add(memberVO);
			}
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
		return membersList;
	}
	
	public void addMember(MemberVO m) throws SQLException, NamingException {
		try {
			con = ConnectionPool.get();
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			String query = "INSERT INTO t_member(id,pwd,name,email)"+"VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
	
	}
	
	public void delMember(String id) throws SQLException, NamingException {
		try {
			con=ConnectionPool.get();
			String query = "DELETE FROM t_member WHERE id =?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		}finally {
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
	}
	
	public MemberVO findMember(String _id) throws SQLException, NamingException {
		MemberVO memInfo = null;
		
		try {
			con = ConnectionPool.get();
			String query = "SELECT * FROM t_member WHERE id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, _id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String email = rs.getString("email");
			Date joinDate = rs.getDate("joinDate");
			memInfo = new MemberVO(id,pwd,name,email,joinDate);
			
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
		return memInfo;
	}
	
	public void modMember(MemberVO memberVO) throws SQLException, NamingException {
		String id = memberVO.getId();
		String pwd = memberVO.getPwd();
		String name = memberVO.getName();
		String email = memberVO.getEmail();
		try {
			con = ConnectionPool.get();
			String query = "UPDATE t_member SET pwd=?, name=?, email=? WHERE id=?";
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
		}finally {
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
	}
}
