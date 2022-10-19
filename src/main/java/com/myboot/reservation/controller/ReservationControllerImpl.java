package com.myboot.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.reservation.service.ReservationService;
import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.user.vo.UserVO;

import oracle.sql.ARRAY;

@Controller("reservationController")
public  class ReservationControllerImpl implements ReservationController{

	@Autowired
	private ReservationService resService;
	@Autowired
	private ReservationVO resVO;
	@Autowired
	private PetserviceVO petVO;
	
//	@RequestMapping("/reservation.do") 
//		public String ReservationMain(Model model){
// 		
//		return "reservationMain"; 
//    	}
	@Override
	@RequestMapping(value= "/reservationForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
		
	}
	@Override
	@RequestMapping(value= "/reservationComplete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationComplete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping("/resList.do") 
	public List resListGet(Model model){
		List ResList = null;
		try {
			ResList = resService.listReservation();
		} catch (Exception e) {

			e.printStackTrace();
		}
			
		return ResList;
	}
	@Override
	@RequestMapping(value= "/reservationAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationAdd( HttpServletRequest request, HttpServletResponse response) throws Exception{
		//유저 정보
		HttpSession session=request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		// 예약 정보
		String checkinDate = (String) request.getParameter("checkinDate");
		String checkoutDate = (String) request.getParameter("checkoutDate");
		String petcomment = (String) request.getParameter("petcomment");
		String costResult = (String) request.getParameter("totalcost");
		
		//petserviceTB
		String[] petName = request.getParameterValues("petname");
		String[] petGender = request.getParameterValues("petsex");
		String[] petRoom = request.getParameterValues("petroom");
		String[] petBeauty = request.getParameterValues("beauty");
		String[] petSpa = request.getParameterValues("spa");

		
		Map petServiceMap = new HashMap();
		
		int listIndex = 0;
		for(int i=0;i<petName.length;i++) {
			
			if(petName[i] != null && petName[i] != "") {
				
				List<String> petServiceList = new ArrayList<String>();
				
				petServiceList.add(petName[i]);
				
				petServiceList.add(petGender[i]);
						
				petServiceList.add(petRoom[i]);
				
				petServiceList.add(petBeauty[i]);
				
				petServiceList.add(petSpa[i]);
			
				petServiceMap.put("petServiceList"+listIndex, petServiceList);
				
				listIndex++;
			}
		}
		resVO.setRes_st(checkinDate);
		resVO.setRes_end(checkoutDate);
		resVO.setRes_comment(petcomment);
		resVO.setId(userVO.getName());
		resVO.setTotalCost(costResult);
		
		resService.addReservation(resVO);
		resService.addPetService(petServiceMap);
		
		
		String viewName = (String)request.getAttribute("redirect:/reservationComplete.do");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}

	
}

