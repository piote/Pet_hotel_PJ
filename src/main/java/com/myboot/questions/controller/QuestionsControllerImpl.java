package com.myboot.questions.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.questions.service.QuestionsService;
import com.myboot.questions.vo.QuestionsVO;

@Controller("questionsController")
public class QuestionsControllerImpl implements QuestionsController{
	@Autowired
	QuestionsService questionsService;
	
	@Autowired
	QuestionsVO questionsVO;
	
	@Override
	@RequestMapping(value= "/questionsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
		List questionsList = questionsService.listQuestions();
		ModelAndView mav = new ModelAndView("questionsList");
		mav.addObject("questionsList", questionsList);
		return mav;
	}
	
	@Override
	@RequestMapping("/questionsForm.do")
	  public String questionsForm(Model model){
		return "questionsForm";
	  }
	
	
//	test _ 작성자 아이디 호출
	@ResponseBody
	@RequestMapping("/QTest.do") 
	public String Main(Model model){
		String a= "";
		try {
			List QList = questionsService.listQuestions();
			  int totalElements = QList.size();
			for(int i=0;i<QList.size();i++) {
				QuestionsVO vo = (QuestionsVO) QList.get(i);
				a += vo.getId()+" ";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
}
