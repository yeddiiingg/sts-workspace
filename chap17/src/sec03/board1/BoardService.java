package sec03.board1;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

public class BoardService {
	boardDAO boardDAO;

	public BoardService() {
		this.boardDAO = new boardDAO();
	}

	public List<ArticleVO> listArticles() throws NamingException, SQLException {
		System.out.println("서비스실행");
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		System.out.println("서비스: "+articlesList.toString());
		return articlesList;
	}
}