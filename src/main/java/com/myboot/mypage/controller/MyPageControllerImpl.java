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
import com.myboot.mypage.vo.MyPageVO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.review.vo.ReviewVO;
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
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		UserVO userVO=(UserVO)session.getAttribute("user");
		String user_id = userVO.getId();	
		
		List<ReservationVO> myReserveList = myPageService.listMyReserve(user_id);
		List<ReviewVO> myReviewList = myPageService.listMyReview(user_id);
		
		mav.addObject("myReserveList", myReserveList);
		mav.addObject("myReviewList", myReviewList);
		return mav;
	}
	
    @Override
    @RequestMapping(value="/checkReserve.do" ,method = RequestMethod.GET)
    public ModelAndView checkReserve(HttpServletRequest request, HttpServletResponse response)  throws Exception {
        HttpSession session = request.getSession();
        
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt(((_section==null)? "1":_section));
		int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
        	
        String colName = request.getParameter("colName");
        String searchWord = request.getParameter("searchWord");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
		UserVO userVO=(UserVO)session.getAttribute("user");
		String user_id = userVO.getId();
		
		session.removeAttribute("startDate");
		session.removeAttribute("endDate");
		
		if(startDate!=null && startDate!="") {
			session.setAttribute("startDate", startDate);
		}
		if(endDate!=null && endDate!="") {
			session.setAttribute("endDate", endDate);
		}
        
        Map paraMap = new HashMap();
        paraMap.put("colName", colName);
        paraMap.put("startDate", startDate);
        paraMap.put("endDate", endDate);
        paraMap.put("searchWord", searchWord);
        paraMap.put("user_id", user_id);
        
		paraMap.put("section", section);
		paraMap.put("pageNum", pageNum);
        
        Map myReserveMap = myPageService.listMyDetailReserve(paraMap, startDate, endDate);
        
		myReserveMap.put("section", section);
		myReserveMap.put("pageNum", pageNum);
		
        String viewName=(String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        if(!"pet_name".equals(colName)) {
        	mav.addObject("colName", colName);
        }else {
        	mav.addObject("colName", colName);
        }
        mav.addObject("startDate", startDate);
        mav.addObject("endDate", endDate);
        mav.addObject("searchWord", searchWord);
        mav.addObject("myReserveMap", myReserveMap);
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
