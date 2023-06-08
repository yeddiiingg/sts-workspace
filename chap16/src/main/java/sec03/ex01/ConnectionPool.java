package sec03.ex01;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
	// 1단계 : JDBC 드라이버 로딩 (Server에 context.xml) 설정정보 작성
	// 2단계 : 데이터베이스 접속을 위한 Connection 객체 생성
	// DataSource: 데이터베이스와 애플리케이션 간의 연결 관리 객체 주로 JDBC에서 사용
	// JDBC : 원격으로 이클립스에서 DB 접속할 수 있도록 도움을 주는 인터페이스
	private static DataSource _ds = null;
	
	public static Connection get() throws NamingException, SQLException {
		if(_ds == null) {
			_ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/mysql");
		}
		return _ds.getConnection();
	}
}
