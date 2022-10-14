package com.myboot.questions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface QuestionsController {
	//public ModelAndView questionsList(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView questionsList(@RequestParam(value ="section", required = false) String _section, @RequestParam(value ="pageNum", required = false) String _pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public String questionsForm(Model model);
}
