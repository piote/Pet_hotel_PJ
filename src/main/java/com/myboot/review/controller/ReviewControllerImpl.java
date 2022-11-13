package com.myboot.review.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
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

import com.myboot.mypage.service.MyPageService;
import com.myboot.review.service.ReviewService;
import com.myboot.review.vo.ReviewVO;
import com.myboot.user.vo.UserVO;

@Controller("reivewController")
public class ReviewControllerImpl implements ReviewController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\review\\article_image";
	
	@Autowired
	private ReviewService reviewService;
	private MyPageService myPageService;
	@Autowired
	private ReviewVO reviewVO;

	@Override

	@RequestMapping(value = "/review/reviewDetail_1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewDetail_1(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession();
		session=request.getSession();
		
	
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		String sort = request.getParameter("sort");
		if(sort == null) {
			sort = "data";
		}
		
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("sort", sort);
	
		if(session.getAttribute("user") != null) {
			UserVO userVO = (UserVO) session.getAttribute("user");
			String user_id = userVO.getId();
			pagingMap.put("user_id", user_id);
		}
		
		Map reviewMap = reviewService.reviewDetail_1(pagingMap);
		
		reviewMap.put("section", section);
		reviewMap.put("pageNum", pageNum);
		reviewMap.put("sort", sort);
		// request.setAttribute("reviewMap",reviewMap );
			
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewMap", reviewMap);

		return mav;

	}

	 @ResponseBody
	  @RequestMapping(value="/like/like.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	  public String like(@RequestParam(value ="review_num", required = false) int reviewNO,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		 JSONObject obj = new JSONObject();
		 
		 HttpSession session = request.getSession();
		 UserVO userVO = (UserVO) session.getAttribute("user");
		 String id = userVO.getId();
		 
		 HashMap <String, Object> hashMap = new HashMap<String, Object>(); 
		 hashMap.put("reviewNO", reviewNO);
		 hashMap.put("id", id);

		 List<ReviewVO> like_checkList = reviewService.selectReviewLikeCheck(hashMap);
		 String like_check = ""; 
		 
		 if(like_checkList.size() == 0) {
			 like_check = "N";
			 //좋아요가 N 일시 좋아요 인서트
			 System.out.println("추가");
			 reviewService.insert_like(hashMap); 
		 }else {
			 like_check = "Y";
			 //좋아요가 Y 일시 좋아요 딜리트
			 System.out.println("삭제");
			 reviewService.delete_like(hashMap);
		 }
		 
		 int like_cnt = reviewService.selectReviewLike(reviewNO);

		 obj.put("like_check", like_check);
		 obj.put("like_cnt", like_cnt);

		 return obj.toString();
	 }
	
	
	
	 @RequestMapping(value = "/review/reviewDetail_2.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView reviewDetail_2(HttpServletRequest request, HttpServletResponse response) throws Exception {

			HttpSession session=request.getSession();
			session=request.getSession();
			
		
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			Map<String, Object> pagingMap = new HashMap<String, Object>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
		
			if(session.getAttribute("user") != null) {
				UserVO userVO = (UserVO) session.getAttribute("user");
				String user_id = userVO.getId();
				pagingMap.put("user_id", user_id);
			}
			
			Map reviewMap = reviewService.reviewDetail_2(pagingMap);
			
			reviewMap.put("section", section);
			reviewMap.put("pageNum", pageNum);
			// request.setAttribute("reviewMap",reviewMap );
				
			String viewName = (String) request.getAttribute("viewName");

			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("reviewMap", reviewMap);

			return mav;

		}

	 @RequestMapping(value = "/review/reviewDetail_3.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView reviewDetail_3(HttpServletRequest request, HttpServletResponse response) throws Exception {

			HttpSession session=request.getSession();
			session=request.getSession();
			
		
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			Map<String, Object> pagingMap = new HashMap<String, Object>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
		
			if(session.getAttribute("user") != null) {
				UserVO userVO = (UserVO) session.getAttribute("user");
				String user_id = userVO.getId();
				pagingMap.put("user_id", user_id);
			}
			
			Map reviewMap = reviewService.reviewDetail_3(pagingMap);
			
			reviewMap.put("section", section);
			reviewMap.put("pageNum", pageNum);
			// request.setAttribute("reviewMap",reviewMap );
				
			String viewName = (String) request.getAttribute("viewName");

			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("reviewMap", reviewMap);

			return mav;

		}

	
	@RequestMapping(value = "/review/reviewForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String res_num = request.getParameter("res_num");

		String viewName = (String) request.getAttribute("viewName");

		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("res_num", res_num);

		return mav;

	}

	
	   
	@RequestMapping(value = "/review/checkReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkReview(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if(session.getAttribute("user") != null) {
			UserVO userVO = (UserVO) session.getAttribute("user");
			String user_id = userVO.getId();
			
			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			 Map pagingMap = new HashMap();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("user_id", user_id);
			Map myReviewMap = reviewService.listMyDetailReview(pagingMap);
			
			myReviewMap.put("section", section);     
			myReviewMap.put("pageNum", pageNum);     
			myReviewMap.put("user_id", user_id);	
			
			
			mav.addObject("myReviewMap", myReviewMap);
		}
		return mav;
	}
	
	@RequestMapping(value = "/review/checkReview2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkReview2(HttpServletRequest request, HttpServletResponse response) throws Exception {

			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			
			System.out.println(viewName + "------뷰네임") ;
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			 Map pagingMap = new HashMap();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			
			Map myReviewMap = reviewService.listMyDetailReview2(pagingMap);
			
			myReviewMap.put("section", section);     
			myReviewMap.put("pageNum", pageNum);     
			
			
			
			mav.addObject("myReviewMap", myReviewMap);
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/review/viewReview.do" ,method = RequestMethod.GET)
	public ModelAndView viewReview(@RequestParam("reviewNO") int reviewNO,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(reviewNO);
		
		Map reviewMap=reviewService.viewReview(reviewNO);
		
		System.out.println(reviewMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("reviewMap", reviewMap);
		
		
		return mav;
		
		
	}
	   

	
	/*
	   @RequestMapping("/review/reviewBoard.do")
	   public String review(Model model) {
	      System.out.println("리뷰");
	      return "/review/reviewBoard";
	   }
	*/
	/*
	@RequestMapping(value = "/review/reviewBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Map<String, Integer> resMap = new HashMap<String, Integer>();
	
		Map myReserveMap = reviewService.listMyDetailReserve(resMap);

		UserVO userVO = (UserVO) session.getAttribute("user");	
		String user_id = userVO.getId();
		myReserveMap.put("user_id", user_id);
		
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("myReserveMap", myReserveMap);

		return mav;
	}
*/
	
	@RequestMapping(value = "/review/reviewBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if(session.getAttribute("user") != null) {
			UserVO userVO = (UserVO) session.getAttribute("user");
			String user_id = userVO.getId();
			
			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			 Map pagingMap = new HashMap();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("user_id", user_id);
			Map myReserveMap = reviewService.listMyDetailReserve(pagingMap);
			
			myReserveMap.put("section", section);
			myReserveMap.put("pageNum", pageNum);
			myReserveMap.put("user_id", user_id);	
			
	
			mav.addObject("myReserveMap", myReserveMap);
		}
		return mav;
	}
	//
	@ResponseBody 
	@RequestMapping(value= "/returnAllRes.do", method = RequestMethod.GET)
	public List returnAllReview(@RequestParam(value ="userId", required = false) String userId,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		List allRes =  reviewService.listRes(userId);
		return allRes;
	}
	
	
	
	/*
	 * @RequestMapping("/reviewDetail_1.do") public String detail_1(Model model){
	 * System.out.println("리뷰"); return "reviewDetail_1"; }
	 */

	// 다중 이미지 글 추가하기

	// @Override
	@RequestMapping(value = "/review/addNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;

		Map reviewMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}

		String rate = (String) reviewMap.get("rate");
		if (rate == null) {
			reviewMap.put("rate", "5");
		}

		// 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
		HttpSession session = multipartRequest.getSession();
		
		//realPath
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\review\\review_image";
	
		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		reviewMap.put("id", id);
		String parentNO = (String) session.getAttribute("parentNO");
		reviewMap.put("parentNO", parentNO);
		// reviewMap.put("res_num", 1);

		List<String> fileList = upload(multipartRequest, path);

		List<String> imageFileList = new ArrayList<String>();
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				imageFileList.add(fileName);
			}
			reviewMap.put("imageFileList", imageFileList);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			System.out.println("in " + path);

			if (imageFileList != null && imageFileList.size() != 0 ) {
				
				if (imageFileList.get(0) != null && imageFileList.get(0) != "")  {
					imageFileName = imageFileList.get(0);
					int reviewNO = reviewService.addNewReview(reviewMap, imageFileName);
					
					File srcFile = new File(path + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(path + "\\" + reviewNO);
					// destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
				}	else {
					int reviewNO = reviewService.addNewReview(reviewMap, imageFileName);
				}
			} else {
				int reviewNO = reviewService.addNewReview(reviewMap, imageFileName);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/review/reviewDetail_1.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (String imageName : imageFileList) {
					imageFileName = imageName;
					File srcFile = new File(path + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/review/reviewForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	

	
	
	
	
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "/review/removeReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeReview(@RequestParam("reviewNO") int reviewNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();

		session.removeAttribute("realPath");
		ServletContext context = request.getSession().getServletContext();
		String realPath = context.getRealPath("");
		session.setAttribute("realPath", realPath);
		
		//String realPath = request.getSession().getServletContext().getRealPath("");

		session.setAttribute("realPath", realPath);

		String path = (String) session.getAttribute("realPath") + "resources\\review\\review_image";
		System.out.println("in " + path);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			reviewService.removeReview(reviewNO);
			File destDir = new File(path + "\\" + reviewNO);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/review/reviewBoard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/review/reviewBoard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	
	@RequestMapping(value="/review/modReview.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest,  
	    HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
	    HttpSession session = multipartRequest.getSession();
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			reviewMap.put(name,value);
		}
		
		//
		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
		String path = realPath+"resources\\review\\review_image";
		
		
		List imageFileName= upload(multipartRequest, path);	
		
		if(imageFileName.get(0) == null || imageFileName.get(0) =="") {
			File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName.get(0));
		      srcFile.delete();
		}
		
		//---------------------------------------------------------------------------------------------
		
		String reviewNO=(String)reviewMap.get("reviewNO");//리뷰 no
		String fileUrl = "resources/review/review_image" + "/" + reviewNO + "/" + imageFileName.get(0);
		reviewMap.put("review_image_url", fileUrl);
		System.out.println(imageFileName.get(0)+"------------------이미지 이름");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	       reviewService.modReview(reviewMap);
	       if(imageFileName.get(0) != "" && imageFileName.get(0) != null) {
	    	   
	    	 String originalFileName = (String)reviewMap.get("originalFileName");
		     System.out.println(originalFileName);
		     File oldFile = new File(realPath+originalFileName);//1   + 234  
		     oldFile.delete();
//	    	   if( "resources/review/review_image" + "\\" +reviewNO+ "\\" + imageFileName.get(0) != originalFileName) {
//	    		   
//	    	   }
	         File srcFile = new File(path + "\\" + "temp" + "\\" + imageFileName.get(0));
	         File destDir = new File(path + "\\" + reviewNO);//123   + 4
	         FileUtils.moveFileToDirectory(srcFile, destDir, true);
	         
	         //String originalFileName = (String)reviewMap.get("originalFileName");

	         
	       }	
	       message = "<script>";
		   message += " alert('글을 수정했습니다.');";
		   message += " location.href='"+multipartRequest.getContextPath()+"/review/viewReview.do?reviewNO="+reviewNO+"';";
		   message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }catch(Exception e) {
	      File srcFile = new File(path+"\\"+"temp"+"\\"+imageFileName.get(0));
	      srcFile.delete();
	      message = "<script>";
		  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/review/viewReview.do?reviewNO="+reviewNO+"';";
		  message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	      e.printStackTrace();
	    }
	    return resEnt;
	  }
	
	
	
	
	
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest, String path) throws Exception {
		
//		String realPath = multipartRequest.getSession().getServletContext().getRealPath("");
//		path = realPath+"resources\\review\\review_image";
		
		List<String> fileList= new ArrayList<String>();
		System.out.println(fileList);
		
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(path + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs(); // 경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(path + "\\" + "temp" + "\\" + originalFileName)); // 임시로 저장된
																								// multipartFile을
																								// 실제
																								// 파일로
																								// 전송
				}
			}
		}
		return fileList;
	}

	@Override
	public String reviewForm(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
//	메인페이지 리뷰조회
	@ResponseBody
	@RequestMapping(value = "/returnReview.do", method = RequestMethod.GET)
	public List<UserVO> returnReview() throws Exception {
		List<UserVO> reviewList = reviewService.returnReviewFormain();
		return reviewList;
	}
}

