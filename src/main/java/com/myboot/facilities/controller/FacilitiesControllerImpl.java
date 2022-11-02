package com.myboot.facilities.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.facilities.service.FacilitiesService;
import com.myboot.facilities.vo.FacilitiesVO;

@Controller("facilitiesController")
public class FacilitiesControllerImpl implements FacilitiesController {
				
	@Autowired
	FacilitiesService facilitiesService;
	
	@Autowired
	FacilitiesVO facilitiesVO;

	@Override
	@RequestMapping(value="/facilities.do" , method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView facilitiesView (HttpServletRequest request, HttpServletResponse response) 
	throws Exception {
		String viewName = "facilities";
		facilitiesVO = (FacilitiesVO) facilitiesService.listfacilities();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("facilities", facilitiesVO);
		System.out.println(facilitiesVO);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modfacilities.do" , method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView modfacilities (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) 
	throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> facilitiesMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			facilitiesMap.put(name,value);
		}
		facilitiesService.modFacilities(facilitiesMap);
		mav.setViewName("redirect:/facilities.do");
		
		return mav;
	} 
}	