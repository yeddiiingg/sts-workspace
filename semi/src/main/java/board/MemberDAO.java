package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemberDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	
	// 커넥션 풀 예제
	public MemberDAO() {
		try {
			Context context = new InitialContext(); // 이름 기반 검색
			dataFactory = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			System.out.println("sucess");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public List<MemberVO> listmembers(){
		List<MemberVO> list = new ArrayList<>();
		try {
			con = dataFactory.getConnection();
			String query = "select * from board";
			pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery(query);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String main = rs.getString("main");
				Date date =rs.getDate("date");
				
				MemberVO vo = new MemberVO();
				
				vo.setId(id);
				vo.setName(name);
				vo.setMain(main);
				vo.setDate(date);
				list.add(vo);
				
			}
			// db 연결과정에서 필요했던 객체들을 닫아줘야함.
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			// 에러메세지 출력
			e.printStackTrace();
		}
		return list;
	}
	
	
	public void addMember (MemberVO memberVO) {
		try {
			con = dataFactory.getConnection();
			int id = memberVO.getId();
			String name = memberVO.getName();
			String main = memberVO.getMain();
			Date date = memberVO.getDate();
			
			String query = "insert into board";
			query += "(name,main,date)";
			query += "values(?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, main);
			pstmt.setDate(4, date);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delMember(int id) {
		try {
			con = dataFactory.getConnection();
			String query = "delete from board where id =?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
