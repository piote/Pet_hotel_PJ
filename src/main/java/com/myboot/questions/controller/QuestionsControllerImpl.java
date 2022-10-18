package com.myboot.questions.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView questionsList(@RequestParam(value ="section", required = false) String _section, 
									  @RequestParam(value ="pageNum", required = false) String _pageNum,
									  @RequestParam(value ="keyword", required = false) String keyword,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		//페이지 시작시 세션 속성 keyword 삭제
		session.removeAttribute("keyword");
		
		//keyword에 값이 들어있으면 생성 > 페이지 기능을 위해서
		if(keyword!=null && keyword!="") {
			session.setAttribute("keyword", keyword);
		}
		
		int section = Integer.parseInt(((_section==null)? "1":_section) );
		int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
		
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		
		Map questionsMap=questionsService.listQuestions_page(pagingMap,keyword);
		
		questionsMap.put("section", section);
		questionsMap.put("pageNum", pageNum);
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("questionsMap", questionsMap);
		return mav;
		
	}
	
	@Override
	@RequestMapping("/questionsForm.do")
	  public String questionsForm(Model model){
		return "questionsForm";
	  }
	

    // 게시글 조회
	@RequestMapping(value="/questionViewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView questionViewArticle(@RequestParam("articleNO") int articleNO,
	                                HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		questionsVO=questionsService.questionsViewArticle(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", questionsVO);
		return mav;
		}
}