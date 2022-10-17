package com.myboot.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("reviewController")
public  class ReviewControllerImpl {

	 @RequestMapping("/reviewBoard.do")
	  public String review(Model model){
		System.out.println("리뷰");
		return "reviewBoard";
	  }
	 
	 @RequestMapping("/reviewDetail_1.do")
	  public String detail_1(Model model){
		System.out.println("리뷰");
		return "reviewDetail_1";
	  }
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
