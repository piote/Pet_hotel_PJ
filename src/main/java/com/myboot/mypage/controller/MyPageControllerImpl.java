package com.myboot.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.mypage.service.MyPageService;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl implements MyPageController {
    @Autowired
    private MyPageService myPageService;
	
	@Override
	@RequestMapping(value="/myPage.do" ,method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}
    @Override
    @RequestMapping(value="/checkReserve.do" ,method = RequestMethod.GET)
    public ModelAndView checkReserve(HttpServletRequest request, HttpServletResponse response)  throws Exception {
        HttpSession session=request.getSession();
        session=request.getSession();
        
        String colName = request.getParameter("colName");
        String searchWord = request.getParameter("searchWord");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        Map<String,String> paraMap = new HashMap<String,String>();
        paraMap.put("colName", colName);
        paraMap.put("searchWord", searchWord);
        paraMap.put("startDate", startDate);
        paraMap.put("endDate", endDate);
        
        String viewName=(String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        mav.setViewName(viewName);
        return mav;
    }
}
