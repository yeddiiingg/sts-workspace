package sec03.board2;

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

   private void doHandle(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
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
            nextPage = "/board2/listArticles.jsp";
            
         }else if(action.equals("/listArticles.do")) {
            articlesList = boardService.listArticles();
            request.setAttribute("articlesList", articlesList);
            nextPage = "/board2/listArticles.jsp";
         
         }else if(action.equals("/articleForm.do")) {
            // 글쓰기 창으로 이동
            nextPage = "/board2/articleForm.jsp";
            
         }else if(action.equals("/addArticle.do")) {
            //DAO를 이용하여 DB에 글 저장(파일첨부도 해야됑 그럼 파일인지 아닌지 check!부터..)
        	 Map<String, String> articleMap = upload(request,response);
        	 // 업로드된 파일 및 폼 필드 데이터를 처리하여 articleMap에 저장
        	 String title = articleMap.get("title");
        	 String content = articleMap.get("content");
        	 String imageFileName = articleMap.get("imageFileName");
        	 
        	 articleVO.setParentNO(0);
        	 articleVO.setId("lee");
        	 articleVO.setTitle(title); //객체의 제목을 설정
        	 articleVO.setContent(content);
        	 articleVO.setImageFileName(imageFileName);
        	 boardService.addArticle(articleVO); //boardService를 사용하여 글을 추가
        	 nextPage = "/board/listArticles.do";
        	 
         }else {
            nextPage = "/board2/listArticles.jsp";
            
         }
         RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
         dispatch.forward(request, response);
         
      } catch (Exception e) {
         System.out.println("예외");
         e.printStackTrace();
      }
   }
   
   // 거의 동일해.. 파일 업로드 확인하는 과졍..?!
   private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response){
	 
	   Map<String, String> articleMap = new HashMap<>(); // 중복 허용 안할라고 해쉬맵 쓴거임
	   // articleMap은 업로드된 파일 및 폼 필드의 데이터를 저장하기 위한 해시맵
	   String encoding = "utf-8";
	   File currentDirPath = new File(ARTICLE_IMAGE_REPO);
	   DiskFileItemFactory factory = new DiskFileItemFactory();
	   factory.setRepository(currentDirPath);
	   factory.setSizeThreshold(1024*1024);
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   
	   try {
		   List items = upload.parseRequest(request);
		   for (int i=0; i <items.size(); i++) {
			   FileItem fileItem = (FileItem) items.get(i);
			   if(fileItem.isFormField()) {  //파일이 아니묜
				   System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));
				   articleMap.put(fileItem.getFieldName(),fileItem.getString(encoding)); //이름과 값 articleMap에 저장
			   }else { // 파일이라면 파일 업로드 처리
				   System.out.println("파일 이름 : "+fileItem.getFieldName());
				   System.out.println("파일 크기 : "+fileItem.getSize());
				   
				   if (fileItem.getSize()>0) { //파일 크기가 0보다 큰 경우에만 처리..
					   int idx = fileItem.getName().lastIndexOf("\\");
					   if(idx == -1) {
						   idx = fileItem.getName().lastIndexOf("/");
					   }
					   
					   String fileName = fileItem.getName().substring(idx+1); //파일명 fileName 변수에 저장
					   System.out.println("파일명 : "+fileName);
					   articleMap.put(fileItem.getFieldName(), fileName);
					   File uploadFile = new File(currentDirPath+"\\"+fileName); //업로드된 파일이 저장될 경로를 설정
					   fileItem.write(uploadFile);
				   }
			   }
		   }
	   }catch (Exception e) {
		   e.printStackTrace();
	}
	   return articleMap;
   }
}
