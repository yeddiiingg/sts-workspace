package sec03.board1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

public class boardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<ArticleVO> selectAllArticles() throws NamingException, SQLException {
		System.out.println("여기 실행?");
		List<ArticleVO> articlesList = new ArrayList();
		try {
			conn = ConnectionPool.get();
			String query ="SELECT\r\n"
					+ "	CONCAT(REPEAT(' ', 4*(fnc.level-1)), tb.title) AS title\r\n"
					+ "    , tb.articleNO, tb.parentNO, tb.content, fnc.level, tb.writedate, tb.id\r\n"
					+ "FROM\r\n"
					+ "	(\r\n"
					+ "		SELECT \r\n"
					+ "			hm_function() AS id, @level AS level\r\n"
					+ "		FROM\r\n"
					+ "			(SELECT @start_with := 0, @id := @start_with, @level := 0) vars\r\n"
					+ "		JOIN \r\n"
					+ "			t_board\r\n"
					+ "		WHERE\r\n"
					+ "			@id IS NOT NULL\r\n"
					+ "	) fnc\r\n"
					+ "LEFT OUTER JOIN\r\n"
					+ "	t_board tb ON fnc.id = tb.articleNO;";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int level = rs.getInt("level");
				int articleNO = rs.getInt("articleNO");
				int parentNO = rs.getInt("parentNO");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				Timestamp writeDate = rs.getTimestamp("writeDate");
				ArticleVO article = new ArticleVO();
				article.setLevel(level);
				article.setArticleNO(articleNO);
				article.setParentNO(parentNO);
				article.setTitle(title);
				article.setContent(content);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}
			System.out.println("다오: "+articlesList.toString());
		} finally {
			if (rs!=null) rs.close();
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		return articlesList;
	}
	
	public void Add(String title, String content) throws SQLException, NamingException {
		
		try {
			conn = ConnectionPool.get();
			String query="INSERT INTO t_board(level,articleNO,parentNO,title,content,id) VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			
		} finally {
			if (rs!=null) rs.close();
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
	}
}
