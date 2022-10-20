package com.myboot.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.mypage.service.MyPageService;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.user.vo.UserVO;

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
		
		UserVO userVO=(UserVO)session.getAttribute("user");
		String user_id = userVO.getId();	
		
		List myReserveList = myPageService.listMyReserve(user_id);
		List myReviewList = myPageService.listMyReview(user_id);
		
		mav.addObject("myReserveList", myReserveList);
		mav.addObject("myReviewList", myReviewList);
		return mav;
	}
	
    @Override
    @RequestMapping(value="/checkReserve.do" ,method = RequestMethod.GET)
    public ModelAndView checkReserve(HttpServletRequest request, HttpServletResponse response)  throws Exception {
        HttpSession session = request.getSession();
        session=request.getSession();
        
        String colName = request.getParameter("colName");
        String searchWord = request.getParameter("searchWord");
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
		UserVO userVO=(UserVO)session.getAttribute("user");
		String user_id = userVO.getId();
        
        Map<String,String> paraMap = new HashMap<String,String>();
        paraMap.put("colName", colName);
        paraMap.put("startDate", startDate);
        paraMap.put("endDate", endDate);
        paraMap.put("searchWord", searchWord);
        paraMap.put("user_id", user_id);
        
        List myReserveList = myPageService.listMyDetailReserve(paraMap);
        String viewName=(String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        if(!"user_name".equals(colName) && !"pet_name".equals(colName) && !"user_tel".equals(colName)) {
        	mav.addObject("colName", colName);
        }else {
        	mav.addObject("colName", colName);
        }
        mav.addObject("myReserveList", myReserveList);
        mav.addObject("startDate", startDate);
        mav.addObject("endDate", endDate);
        mav.addObject("searchWord", searchWord);
        return mav;
    }
    

	@Override
	@RequestMapping(value="/cancelMyReserve.do" ,method = RequestMethod.POST)
	public ModelAndView cancelMyReserve(@RequestParam("res_num")  String res_num,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelReserve(res_num);
		mav.addObject("message", "C");
		mav.setViewName("redirect:/mypage/checkReserve.do");
		return mav;
	}

}
