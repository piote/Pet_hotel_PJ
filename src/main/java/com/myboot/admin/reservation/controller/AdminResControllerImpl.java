package com.myboot.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.reservation.service.AdminResService;
import com.myboot.admin.reservation.vo.AdminPetserviceVO;
import com.myboot.admin.reservation.vo.AdminResFullVO;
import com.myboot.admin.reservation.vo.AdminReservationVO;

@Controller("adminresController")
public  class AdminResControllerImpl implements AdminResController{

	@Autowired
	private AdminResService adminresService;
	@Autowired
	private AdminResFullVO adminresfullVO;
	@Autowired
	private AdminPetserviceVO adminpetVO;
	@Autowired
	private AdminReservationVO adminresVO;
	
	
	@Override
	@RequestMapping(value= "/adminresForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminResMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
	
		if(session.getAttribute("admin")==null) {
			request.setAttribute("stmsgcheck", "1");
			request.setAttribute("stmsg", "비정상적인 접근입니다!");
			mav.setViewName("forward:/main.do");
			//mav.setViewName("redirect:/main.do");
		}else {
			String  viewName= (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
		}
		
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping("/adminresList.do") 
	public List adminresListGet(Model model){
		List adminResList = null;
		try {
			adminResList = adminresService.adminAllResList();
		} catch (Exception e) {

			e.printStackTrace();
		}
			
		return adminResList;
	}

}

