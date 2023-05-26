package sec01.ex01;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context context = new InitialContext();
			dataFactory = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	public List<MemberBean> listmembers(){
		List<MemberBean> list = new ArrayList<>();
		try {
			
			con = dataFactory.getConnection();
			String query = "SELECT * FROM member";
			pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery(query);
			while(rs.next()) {
				Integer num_id = rs.getInt("num_id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				Date joinDate = rs.getDate("joinDate");

				
				MemberBean vo = new MemberBean();
				vo.setNum_id(num_id);
				vo.setName(name);
				vo.setPwd(pwd);
				vo.setJoinDate(joinDate);
				list.add(vo);
				
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		}
	
	public void addMember(MemberBean memberBean) {
		
		try {
			Connection con = dataFactory.getConnection();
			String name = memberBean.getName();
			String pwd = memberBean.getPwd();
			String query = "INSERT INTO member";
			query += "(name,pwd)";
			query +=" values(?,?)";

			
		} catch (Exception e) {
		}
}

	

	

}
