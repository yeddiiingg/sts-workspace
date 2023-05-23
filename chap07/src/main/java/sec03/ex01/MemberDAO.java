package sec03.ex01;

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

import com.mysql.cj.xdevapi.PreparableStatement;

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
			// db에 연결되어 있다면
			// connDB();
			con = dataFactory.getConnection();
			String query = "select * from customer";
			pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery(query);
			while(rs.next()) {
				int custid = rs.getInt("custid");
				String name = rs.getString("name");
				String identy = rs.getString("identy");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				
				MemberVO vo = new MemberVO();
				
				vo.setCustid(custid);
				vo.setName(name);
				vo.setIdenty(identy);
				vo.setAddress(address);
				vo.setPhone(phone);
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
			Integer custid = memberVO.getCustid();
			String name = memberVO.getName();
			String identy = memberVO.getIdenty();
			String address = memberVO.getAddress();
			String phone = memberVO.getPhone();
			
			String query = "insert into customer";
			query += "(custid,name,identy,address,phone)";
			query += "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, custid);
			pstmt.setString(2, name);
			pstmt.setString(3, identy);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
