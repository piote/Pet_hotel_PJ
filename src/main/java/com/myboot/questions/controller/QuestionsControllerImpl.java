package com.myboot.questions.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.questions.service.QuestionsService;
import com.myboot.questions.vo.QuestionsVO;
import com.myboot.user.vo.UserVO;

@Controller("questionsController")
public class QuestionsControllerImpl implements QuestionsController{
	
	
	//private static final String ARTICLE_IMAGE_REPO = "C:\\questions\\questions_image";
	
	
	@Autowired
	QuestionsService questionsService;
	
	@Autowired
	QuestionsVO questionsVO;

	@Override
	@RequestMapping(value= "/questions/questionsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionsList(@RequestParam(value ="section", required = false) String _section, 
									  @RequestParam(value ="pageNum", required = false) String _pageNum,
									  @RequestParam(value ="keyword", required = false) String keyword,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		//페이지 시작시 세션 속성 keyword 삭제
		session.removeAttribute("keyword");
		
		//keyword에 값이 들어있으면 생성 > 페이지 기능을 위해서
		if(keyword!=null && keyword!="") {
			session.setAttribute("keyword", keyword);
		}
		
		int section = Integer.parseInt(((_section==null)? "1":_section) );
		int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
		
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		
		Map questionsMap=questionsService.listQuestions_page(pagingMap,keyword);
		
		questionsMap.put("section", section);
		questionsMap.put("pageNum", pageNum);
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("questionsMap", questionsMap);
		return mav;
		
	}
	
//	@Override
//	@RequestMapping("/questions/questionsForm.do")
//	  public String questionsForm(Model model){
//		return "/questions/questionsForm";
//	  }
	

	@RequestMapping(value = "/questions/*Form.do", method = {RequestMethod.GET,RequestMethod.POST })
	private ModelAndView form(@RequestParam(value = "parentNO", required = false) String parentNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		
		//수정하기 일때
		if(viewName.equals("/questions/replyForm")) {
			if(parentNO != null) {
				session.setAttribute("parentNO", parentNO);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		//서블릿에서 경로를 받아와서 세션에 저장하는 코드 
//		session.removeAttribute("realPath");
//		ServletContext context = request.getSession().getServletContext();
//		String realPath = context.getRealPath("");
//		session.setAttribute("realPath", realPath);

		return mav;
	}
	

    // 게시글 조회
	@Override
	@RequestMapping(value="/questions/questionViewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView questionViewArticle(@RequestParam("articleNO") int articleNO,
	                                HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		questionsVO=questionsService.questionsViewArticle(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", questionsVO);
		
		//서블릿에서 경로를 받아와서 세션에 저장하는 코드 
//		HttpSession session = request.getSession();
//		session.removeAttribute("realPath");
//		ServletContext context = request.getSession().getServletContext();
//		String realPath = context.getRealPath("");
//		session.setAttribute("realPath", realPath);
		
		return mav;
		}
	
//	새 문의글 쓰기
	@Override
	@RequestMapping(value="/questions/addNewQuestion.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		
		//세션에 저장된 경로를 받아온다 << 안씀
//		String path = (String) session.getAttribute("realPath")+"resources\\questions\\questions_image";
//		System.out.println("in "+path);
		
		
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\questions\\questions_image";
		
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = questionsService.addNewQuestions(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new File(path+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(path+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/questions/questionsList.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/questions/questionsList.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		//다 쓴 경로 삭제
		session.removeAttribute("realPath");
		return resEnt;
	}
	
//	답글 쓰기
	@Override
	@RequestMapping(value="/questions/addReplyQuestion.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addReplyQuestion(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		
		String parentNO = (String) session.getAttribute("parentNO");
		
		String imageFileName= upload(multipartRequest);
		
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		articleMap.put("parentNO", parentNO);
		
		String message;
		ResponseEntity resEnt=null;
		
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\questions\\questions_image";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int articleNO = questionsService.addReplyQuestions(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new File(path+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(path+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
			
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/questions/questionsList.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/questions/questionsList.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		//다 쓴 경로 삭제
		session.removeAttribute("realPath");
		session.removeAttribute("parentNO");
		return resEnt;
	}
	
	
	//한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		//세션에 있는 경로를 받아온다
//		HttpSession session = multipartRequest.getSession();
//		String path = (String) session.getAttribute("realPath")+"resources\\questions\\questions_image";
		
		
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\questions\\questions_image";

		System.out.println(path);
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(path +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(path +"\\"+"temp"+ "\\"+imageFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
		}
		return imageFileName;
	}
	
	//게시글 삭제하기
	 @Override
	  @RequestMapping(value="/questions/removeArticle.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity  removeQuestionsArticle(@RequestParam("q_num") int q_num,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception{
	   response.setContentType("text/html; charset=UTF-8");
	   String message;
	   ResponseEntity resEnt=null;
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	   
		//============================================realPath 받아오기
		String realPath = request.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\questions\\questions_image";
	   
	   try {
		  questionsService.removeQuestionsArticle(q_num);
	      File destDir = new File(path+"\\"+q_num);
	      FileUtils.deleteDirectory(destDir);
	      
	      message = "<script>";
	      message += " alert('글을 삭제했습니다.');";
	      message += " location.href='"+request.getContextPath()+"/questions/questionsList.do';";
	      message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	          
	   }catch(Exception e) {
	      message = "<script>";
	      message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
	      message += " location.href='"+request.getContextPath()+"/questions/questionsList.do';";
	      message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       e.printStackTrace();
	   }
	   return resEnt;
	  }  

	  //한 개 이미지 수정 기능
	  @RequestMapping(value="/questions/modQuestionsArticle.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity modQuestionsArticle(MultipartHttpServletRequest multipartRequest,  
	    HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
	   Map<String,Object> articleMap = new HashMap<String, Object>();
	   Enumeration enu=multipartRequest.getParameterNames();
	   while(enu.hasMoreElements()){
	      String name=(String)enu.nextElement();
	      String value=multipartRequest.getParameter(name);
	      articleMap.put(name,value);
	   }
	   
	   String imageFileName= upload(multipartRequest);
	   articleMap.put("imageFileName", imageFileName);
	   
	   String articleNO=(String)articleMap.get("q_num");
	   String message;
	   ResponseEntity resEnt=null;
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	   
		//============================================realPath 받아오기
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\questions\\questions_image";
	   
	    try {
	    	questionsService.modQuestionsArticle(articleMap);
	       if(imageFileName!=null && imageFileName.length()!=0) {
	         File srcFile =  new File(path+ "\\" + "temp"+ "\\" + imageFileName);
	         File destDir = new File(path+"\\"+articleNO);
	         FileUtils.moveFileToDirectory(srcFile, destDir, true);
	         
	         String originalFileName = (String)articleMap.get("originalFileName");
	         File oldFile = new File(path+"\\"+articleNO+"\\"+originalFileName);
	         oldFile.delete();
	       }   
	       message = "<script>";
	      message += " alert('글을 수정했습니다.');";
	      message += " location.href='"+multipartRequest.getContextPath()+"/questions/questionViewArticle.do?articleNO="+articleNO+"';";
	      message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }catch(Exception e) {
	      File srcFile = new File(path+ "\\" + "temp"+ "\\" + imageFileName);
	      srcFile.delete();
	      message = "<script>";
	     message += " alert('오류가 발생했습니다.다시 수정해주세요');";
	     message += " location.href='"+multipartRequest.getContextPath()+"/questions/questionViewArticle.do?articleNO="+articleNO+"';";
	     message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	      e.printStackTrace();
	    }
	    return resEnt;
	  }
}