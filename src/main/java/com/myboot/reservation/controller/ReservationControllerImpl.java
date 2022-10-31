package com.myboot.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.myboot.reservation.service.ReservationService;
import com.myboot.reservation.service.ReservationServiceImpl;
import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ResFullVO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.user.vo.UserVO;

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
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		if(session.getAttribute("user")==null) {
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
	
	@Override
	@RequestMapping(value= "/reservationComplete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationComplete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		if(session.getAttribute("user")==null || request.getHeader("REFERER") == null) {
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
	
	@Override
	@RequestMapping(value= "/reservationUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
	
	//예약 하기
	@Override
	@RequestMapping(value= "/reservationAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reservationAdd( HttpServletRequest request, HttpServletResponse response) throws Exception{
		//유저 정보
		HttpSession session=request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
				
		//날짜 포맷
		String checkinDate = (String) request.getParameter("checkinDate");//스트링 데이터로 변환하기 포멧
		String checkoutDate = (String) request.getParameter("checkoutDate");//
		
		//로그인 x 거나 이전 페이지 값 없으면 되돌려보네기 
		if(session.getAttribute("user")==null || checkinDate == null) {
			ModelAndView mav = new ModelAndView();
			request.setAttribute("stmsgcheck", "1");
			request.setAttribute("stmsg", "비정상적인 접근입니다!");
			mav.setViewName("forward:/main.do");
			//mav.setViewName("redirect:/main.do");
			return mav;
		}
		
		
		

		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy. MM. dd");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		// String 타입을 Date 타입으로 변환
		Date checkinDate_format = dtFormat.parse(checkinDate);
		Date checkoutDate_format = dtFormat.parse(checkoutDate);
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환 Date 타입이기만 하면 되나?
		//String checkinDate_format_new = newDtFormat.format(checkinDate_format);
		//String checkoutDate_format_new = newDtFormat.format(checkoutDate_format);
		//https://junghn.tistory.com/entry/JAVA-자바-날짜-포맷-변경-방법SimpleDateFormat-yyyyMMdd
		
		
		// 예약 정보
		
		String petcomment = (String) request.getParameter("petcomment");
		String costResult = (String) request.getParameter("totalcost");
		
		//petserviceTB
		String[] petName = request.getParameterValues("petname");
		String[] petGender = request.getParameterValues("petsex");
		String[] petRoom = request.getParameterValues("petroom");
		String[] petBeauty = request.getParameterValues("beauty");
		String[] petSpa = request.getParameterValues("spa");

		//데이터 베이스 - 예약번호 찾기
		int resNum = resService.useReservationNum();
		System.out.println("예약번호============="+resNum);
			
		//pet서비스 vo List만들기
		List<PetserviceVO> petServiceList = new ArrayList<PetserviceVO>();

		for(int i=0;i<petName.length;i++) {
			
			if(petName[i] != null && petName[i] != "") {
				
				PetserviceVO petserVO = new PetserviceVO();
				petserVO.setRes_num(resNum);
				petserVO.setId(userVO.getId());
				petserVO.setPet_name(petName[i]);
				petserVO.setPet_gender(petGender[i]);
				petserVO.setRoom_grade(petRoom[i]);
				petserVO.setService_beauty(petBeauty[i]);
				petserVO.setService_spa(petSpa[i]);
				System.out.println(petserVO);
				petServiceList.add(petserVO);
		
			}
		}
		
		ReservationVO reserVO = new ReservationVO();
		//예약 vo
		reserVO.setRes_num(resNum);
		reserVO.setRes_st(checkinDate_format);
		reserVO.setRes_end(checkoutDate_format);
		reserVO.setRes_comment(petcomment);
		reserVO.setId(userVO.getId());
		reserVO.setTotalCost(costResult);
		
		//데이터 베이스
		resService.addReservation(reserVO);
		resService.addPetService(petServiceList);
		
		ModelAndView mav = new ModelAndView("redirect:/reservationComplete.do");
		
		return mav;
	}
	
	//예약 번호로 예약 찾기 
	@ResponseBody 
	@RequestMapping(value= "/SearchReservationNum.do", method = RequestMethod.POST)
	public HashMap SearchReservationNum(
			@RequestParam(value ="reserNum", required = false) String reserNum,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
			
		ReservationVO reser; 
		List<PetserviceVO> reserP; 
		
		reser = resService.SearchReservationNum(reserNum);
		reserP = resService.SearchPetServiceByResNum(reserNum);
		
		HashMap reservationMap = new HashMap();
		
		reservationMap.put("reservation", reser);//예약 테이블
		reservationMap.put("petservice", reserP);//펫 서비스 테이블 들
		
		return reservationMap;
	}

	
}

