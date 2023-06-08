package sec03.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sec03.ex01.MemberVO;

public class MemberDAO {

	// id 중복 체크
	public boolean IDcheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		// DB연동 : my_db > t_member
		try {
			con = ConnectionPool.get(); 
			//String query = "select decode(count(*),1,'true','false') as result from t_member";
			//String query = "SELECT IF(COUNT(*) = 1, 'true','false') AS result FROM t_member";
			String query = "SELECT CASE COUNT(*) WHEN 1 THEN 'true' ELSE 'false' END AS result FROM t_member";
			query+=" where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<MemberVO> listMembers() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = ConnectionPool.get();
			String query = "SELECT * FROM t_member ";	

			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberVO vo = new MemberVO(id, pwd, name, email, joinDate);
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
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
}