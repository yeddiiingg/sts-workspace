package sec03.board3;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

public class BoardService {
	boardDAO boardDAO;

	public BoardService() {
		this.boardDAO = new boardDAO(); // mySQL
//		this.boardDAO = new boardDAO2(); // ORACLE
	}

	public List<ArticleVO> listArticles() throws NamingException, SQLException {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}
	
	public int addArticle(ArticleVO article) throws NamingException, SQLException {
		return boardDAO.insertNewArticle(article);
	}
	
	public ArticleVO viewArticle(int articleNO) throws UnsupportedEncodingException, NamingException, SQLException {
		ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}
	
	public int modArticle(ArticleVO article) throws NamingException, SQLException {
		return boardDAO.updateArticle(article);
	}
}