package sec03.board1;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
	private static DataSource _ds = null;
	
	// DB와 연결해주는 커넥션 반환 메서드 필요
	public static Connection get() throws NamingException, SQLException {
		if (_ds == null) {
			_ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/mysql");
		}
		return _ds.getConnection();
	}
	
}
