package sec02.ex02;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
	
	private static DataSource ds = null;
	// DB과 연결해주는 커넥션 반환 메서드 필요
	
	public static Connection get() throws SQLException, NamingException {
		if(ds == null) {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/mysql");
		}
		return ds.getConnection();
	}
}
