package com.myboot.questions.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface QuestionsController {
	//public ModelAndView questionsList(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView questionsList(@RequestParam(value ="section", required = false) String _section, @RequestParam(value ="pageNum", required = false) String _pageNum,@RequestParam(value ="keyword", required = false) String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	//public String questionsForm(Model model);
	public ModelAndView questionViewArticle(@RequestParam("articleNO") int articleNO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception;
    public ResponseEntity  removeQuestionsArticle(@RequestParam("q_num") int q_num,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
    public ResponseEntity modQuestionsArticle(MultipartHttpServletRequest multipartRequest,  
	        HttpServletResponse response) throws Exception;		
    public ResponseEntity addReplyQuestion(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception;
}
