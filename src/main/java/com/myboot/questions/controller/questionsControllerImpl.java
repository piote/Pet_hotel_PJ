package com.myboot.questions.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class questionsControllerImpl {
	@RequestMapping("/questionsForm.do")
	  public String review(Model model){
		System.out.println("q");
		return "questionsForm";
	  }
}
