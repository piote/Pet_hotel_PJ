package com.myboot.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public  class reviewController {

	 @RequestMapping("/reviewBoard.do")
	  public String review(Model model){
		System.out.println("리뷰");
		return "reviewBoard";
	  }
	 
	 @RequestMapping("/reviewDetail.do")
	  public String detail(Model model){
		System.out.println("리뷰");
		return "reviewDetail";
	  }
	 
}
