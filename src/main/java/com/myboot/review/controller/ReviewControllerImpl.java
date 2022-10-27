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

import com.myboot.review.service.ReviewService;
import com.myboot.review.vo.ImageVO;
import com.myboot.review.vo.ReviewVO;
import com.myboot.user.vo.UserVO;

@Controller("reivewController")
public class ReviewControllerImpl implements ReviewController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\review\\article_image";
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ReviewVO reviewVO;

	@Override

	@RequestMapping(value = "/review/reviewDetail_1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewDetail_1(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		Map reviewMap = reviewService.reviewDetail_1(pagingMap);

		reviewMap.put("section", section);
		reviewMap.put("pageNum", pageNum);
		// request.setAttribute("reviewMap",reviewMap );

		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewMap", reviewMap);

		return mav;

	}

	@RequestMapping(value = "/review/reviewDetail_2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewDetail_2(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
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

		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		Map reviewMap = reviewService.reviewDetail_3(pagingMap);

		reviewMap.put("section", section);
		reviewMap.put("pageNum", pageNum);
		// request.setAttribute("reviewMap",reviewMap );

		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewMap", reviewMap);

		return mav;

	}

	/*
	 * @Override
	 * 
	 * @RequestMapping(value= "/review/reviewDetail_1.do", method =
	 * {RequestMethod.GET, RequestMethod.POST}) public ModelAndView
	 * reviewDetail_1(HttpServletRequest request, HttpServletResponse response)
	 * throws Exception {
	 * 
	 * String viewName = (String)request.getAttribute("viewName"); List reviewList =
	 * reviewService.reviewDetail_1(Map pagingMap); ModelAndView mav = new
	 * ModelAndView(viewName); mav.addObject("reviewList", reviewList); return mav;
	 * 
	 * }
	 */

	@Override
	@RequestMapping("/review/reviewForm.do")
	public String reviewForm(Model model) {
		return "reviewForm";
	}

	@RequestMapping("/reviewBoard.do")
	public String review(Model model) {
		System.out.println("리뷰");
		return "reviewBoard";
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

		session.removeAttribute("realPath");
		ServletContext context = multipartRequest.getSession().getServletContext();
		String realPath = context.getRealPath("");
		session.setAttribute("realPath", realPath);

		UserVO userVO = (UserVO) session.getAttribute("user");
		String id = userVO.getId();
		reviewMap.put("id", id);
		String parentNO = (String) session.getAttribute("parentNO");
		reviewMap.put("parentNO", parentNO);
		reviewMap.put("res_num", 1);

		String path = (String) session.getAttribute("realPath") + "resources\\review\\review_image";

		List<String> fileList = upload(multipartRequest, path);

		List<ImageVO> imageFileList = new ArrayList<ImageVO>();
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				ImageVO imageVO = new ImageVO();
				imageVO.setImageFileName(fileName);
				imageFileList.add(imageVO);
			}
			reviewMap.put("imageFileList", imageFileList);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			System.out.println("in " + path);

			if (imageFileList != null && imageFileList.size() != 0) {
				ImageVO imageVO = imageFileList.get(0);
				imageFileName = imageVO.getImageFileName();
				int reviewNO = reviewService.addNewReview(reviewMap, imageFileName);
				File srcFile = new File(path + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(path + "\\" + reviewNO);
				// destDir.mkdirs();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

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
				for (ImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getImageFileName();
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
			message += " location.href='" + request.getContextPath() + "/reviewBoard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/reviewBoard.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest, String path) throws Exception {
		List<String> fileList = new ArrayList<String>();
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

}
