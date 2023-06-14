package sec03.board3;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	BoardService boardService;
	ArticleVO articleVO;

	public void init(ServletConfig confing) throws ServletException {
		boardService = new BoardService();
		articleVO = new ArticleVO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		try {
			List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
			if (action == null) {
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board3/listArticles.jsp";
				
			} else if (action.equals("/listArticles.do")) {
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board3/listArticles.jsp";
				
			} else if (action.equals("/articleForm.do")) {
				nextPage = "/board3/articleForm.jsp";
				
			} else if (action.equals("/addArticle.do")) {
				int articleNO = 0;
				Map<String, String> articleMap = upload(request, response);
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");

				articleVO.setParentNO(0);
				articleVO.setId("lee");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				articleNO = boardService.addArticle(articleVO);
				// 첨부한 파일이 있는 경우에 수행
				if(imageFileName!=null && imageFileName.length()!=0) {
					// temp 폴더에 임시로 업로드된 파일 객체 생성
					File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					// 글 번호 폴더 생성
					File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
					destDir.mkdir(); 
					// temp폴더의 파일을 글번호 폴더로 이동
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				nextPage = "/board/listArticles.do";
				
			}else if(action.equals("/viewArticle.do")) {
				// 상세 페이지 보이기
				String articleNO = request.getParameter("articleNO");
				articleVO = boardService.viewArticle(Integer.parseInt(articleNO));
				request.setAttribute("article", articleVO);
				System.out.println(articleVO);
				nextPage = "/board3/viewArticle.jsp";
				
			} else if (action.equals("/modArticle.do")) {
				int articleNO = 0;
				Map<String, String> articleMap = upload(request, response);
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");

				articleVO.setParentNO(0);
				articleVO.setId("lee");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				articleNO = boardService.modArticle(articleVO);
				// 첨부한 파일이 있는 경우에 수행
				if(imageFileName!=null && imageFileName.length()!=0) {
					// temp 폴더에 임시로 업로드된 파일 객체 생성
					File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					// 글 번호 폴더 생성
					File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
					destDir.mkdir(); 
					// temp폴더의 파일을 글번호 폴더로 이동
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				nextPage = "/board/listArticles.do";
			}
			else {
				nextPage = "/board3/listArticles.jsp";
			}

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> articleMap = new HashMap<>();
		String encoding = "utf-8";
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			// request로 전달된 form데이터 값을 분리하여 추출하는 작업
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if (fileItem.isFormField()) { // 일반 input
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else { // 파일 input
					System.out.println("파일이름: " + fileItem.getFieldName());
					System.out.println("파일크기: " + fileItem.getSize());

					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\"); // 윈도우 기반
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/"); // 리눅스 기반
						}
						
						String fileName = fileItem.getName().substring(idx+1);
						System.out.println("파일명: "+ fileName);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath+"\\temp\\"+fileName);
						fileItem.write(uploadFile);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return articleMap;
	}
}