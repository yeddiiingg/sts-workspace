package sec01.ex02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}