package com.myboot.questions.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class questionsControllerImpl {
	
	@RequestMapping("/questionsList.do")
	public String questionsList(Model model){
		System.out.println("q");
		return "questionsList";
	}
	@RequestMapping("/questionsForm.do")
	  public String questionsForm(Model model){
		System.out.println("q");
		return "questionsForm";
	  }
}
