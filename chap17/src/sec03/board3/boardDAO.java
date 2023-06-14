package sec03.board3;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
	
	private int getNewArticleNO() throws SQLException, NamingException {
		try {
			conn = ConnectionPool.get();
			String query = "SELECT max(articleNO) FROM t_board";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				return (rs.getInt(1)+1);
		} finally {
			if (rs!=null) rs.close();
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		return 0;
	}
	
	public int insertNewArticle(ArticleVO article) throws NamingException, SQLException {
		int articleNO = getNewArticleNO();
		try {
			int parentNO = article.getParentNO();

			conn = ConnectionPool.get();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			String query = "INSERT INTO t_board (articleNO, parentNO, title, content, imageFileName, id)"
					+ "VALUES (?,?,?,?,?,?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.setInt(2, parentNO);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, imageFileName);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		} finally {
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		return articleNO;
	}
	
	public int updateArticle(ArticleVO article) throws NamingException, SQLException {
//		int articleNO = getNewArticleNO();
		int articleNO = 0;
		try {
			int parentNO = article.getParentNO();
			
			conn = ConnectionPool.get();
			String title = article.getTitle();
			String content = article.getContent();
			String imageFileName = article.getImageFileName();
			articleNO = article.getArticleNO();
			
			String query = "UPDATE t_board SET title=?, content=?";
			if (imageFileName != null && imageFileName.length() !=0) {
				query +=", imageFileName=?";
			}
			query += " WHERE articleNO=?";
			System.out.println("here!"+articleNO);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, articleNO);
			} else {
				pstmt.setInt(3, articleNO);
			}
			
			System.out.println(query);
			pstmt.executeUpdate();
			
		} finally {
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		return articleNO;
	}
	
	
	
	
	public ArticleVO selectArticle(int articleNO) throws NamingException, SQLException, UnsupportedEncodingException {
		ArticleVO article = new ArticleVO();
		try {
			conn = ConnectionPool.get();
			String query = "SELECT articleNO, parentNO, title, content, IFNULL(imageFileName, 'null') AS imageFileName, id, writeDate"
					       +" FROM t_board"
					       +" WHERE articleNO = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			rs = pstmt.executeQuery();
			rs.next();
			int _articleNO = rs.getInt("articleNO");
			int _parentNO = rs.getInt("parentNO");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String imageFileName = URLEncoder.encode(rs.getString("imageFileName"),"UTF-8");
			if(imageFileName.equals("null")) {
				imageFileName = null;
			}
			String id = rs.getString("id");
			Timestamp writeDate = rs.getTimestamp("writeDate");
			
			article.setArticleNO(_articleNO);
			article.setParentNO(_parentNO);
			article.setTitle(title);
			article.setContent(content);
			article.setImageFileName(imageFileName);
			article.setId(id);
			article.setWriteDate(writeDate);
			
		} finally {
			if (rs!=null) rs.close();
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		
		return article;
	}
	
	public void deleteArticle(int articleNO) throws NamingException, SQLException {
		
		try {
			conn = ConnectionPool.get();
			String query = "DELETE FROM t_board"
					+ " WHERE articleNO = ?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.executeUpdate();
			
		} finally {
			if (pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}
		
	}
}
