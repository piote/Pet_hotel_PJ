package com.myboot.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public  class reviewController {

	 @RequestMapping("/reviewboard.do")
	  public String review(Model model){
		System.out.println("리뷰");
		return "reviewboard";
	  }
}
