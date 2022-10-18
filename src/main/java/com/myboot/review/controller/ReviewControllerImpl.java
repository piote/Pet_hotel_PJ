package com.myboot.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.review.service.ReviewService;
import com.myboot.review.vo.ReviewVO;

@Controller("reivewController")
public  class ReviewControllerImpl  implements ReviewController {

	 	@Autowired
	 	private ReviewService reviewService;
	 	
	 	@Autowired
	 	private ReviewVO reviewVO;
	 	
	 	@Override
	 	@RequestMapping(value= "/review/reviewDetail_1.do", method = {RequestMethod.GET, RequestMethod.POST})
	 	public ModelAndView reviewDetail_1(HttpServletRequest request, HttpServletResponse response) throws Exception {

	 		String _section=request.getParameter("section");
	 		String _pageNum=request.getParameter("pageNum");
	 		int section = Integer.parseInt(((_section==null)? "1":_section) );
	 		int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
	 		Map pagingMap=new HashMap();
	 		pagingMap.put("section", section);
	 		pagingMap.put("pageNum", pageNum);
	 		Map reviewMap=reviewService.reviewDetail_1(pagingMap);
	 		
	 		reviewMap.put("section", section);
	 		reviewMap.put("pageNum", pageNum);
	 		
	 		String viewName = (String)request.getAttribute("viewName");
//	 		List articlesList = boardService.listArticles();
	 				
	 		ModelAndView mav = new ModelAndView(viewName);
	 		mav.addObject("reviewMap", reviewMap);
	 		return mav;
	 		
	 	}
	 
	 	@Override
		@RequestMapping("/reviewForm.do")
		  public String reviewForm(Model model){
			return "reviewForm";
		  }
	 
		 @RequestMapping("/reviewBoard.do")
		  public String review(Model model){
			System.out.println("리뷰");
			return "reviewBoard";
		  }
		 
			/*
			 * @RequestMapping("/reviewDetail_1.do") public String detail_1(Model model){
			 * System.out.println("리뷰"); return "reviewDetail_1"; }
			 */
		 @RequestMapping("/reviewDetail_2.do")
		  public String detail_2(Model model){
			System.out.println("리뷰");
			return "reviewDetail_2";
		  }
		 @RequestMapping("/reviewDetail_3.do")
		  public String detail_3(Model model){
			System.out.println("리뷰");
			return "reviewDetail_3";
		  }
		 
		 
	 
	 }
