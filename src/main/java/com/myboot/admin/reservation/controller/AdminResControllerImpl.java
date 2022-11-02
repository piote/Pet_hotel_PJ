package com.myboot.admin.reservation.controller;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.reservation.service.AdminResService;
import com.myboot.admin.reservation.vo.AdminPetserviceVO;
import com.myboot.admin.reservation.vo.AdminResFullVO;
import com.myboot.admin.reservation.vo.AdminReservationVO;
import com.myboot.user.vo.UserVO;

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
	@Autowired
	private UserVO userVO;
	
	
	@Override
	@RequestMapping(value= "/adminresForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminResMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		AdminResFullVO adminResList = (AdminResFullVO) session.getAttribute("adminreslist");
		
		return mav;
		
	}
	
	
	
	
	
	@Override
//	@RequestMapping("/admin/adminResList.do")
	public ModelAndView ResList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		userVO = (UserVO) session.getAttribute("user");
		
		response.setCharacterEncoding("EUC-KR");
		if(userVO!=null) {
			System.out.println(userVO);
			System.out.println(userVO.getId());
			
			if(userVO.getId().equals("admin")) {
				System.out.println("관리자");
				mav.setViewName("/admin/adminResList");
				return mav;
			}
		}
		
		PrintWriter writer = response.getWriter();
		writer.println("<script type='text/javascript'>");
		writer.println("alert('권한이 없습니다.');");
		writer.println("history.back();");
		writer.println("</script>");
		writer.flush();
		return null;
		
	}
		
	
	//예약 불러오기       //dao list > 배열로 만드는데 필요한 값만 들고오기
	@ResponseBody
	@RequestMapping(value= "/admin/adminResList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ResReed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		AdminResFullVO adminResList = (AdminResFullVO) session.getAttribute("adminreslist");
		
		//총 예약갯수
		int totalresnum = adminresService.adminTotalResNum();
		
		mav.addObject("totalresnum",totalresnum);
		
		
		
		//예약데이터
		List<AdminResFullVO> adminResReed = adminresService.adminAllResList();   //
		
		System.out.println(adminResReed);
		
		mav.addObject("adminResReed",adminResReed);  //
		
		String  viewName= (String)request.getAttribute("viewName");   //
		mav.setViewName(viewName);
		
		return mav;   //
		
		
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
	
	//예약 수정
	@Override
	@RequestMapping(value= "/adminresUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminResUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//예약 정보
		HttpSession session = request.getSession();
		AdminResFullVO adminresfullVO = (AdminResFullVO) session.getAttribute("adminreslist");
		
		//날짜 포맷
		String checkinDate = (String) request.getParameter("checkinDate");
		String checkoutDate = (String) request.getParameter("checkoutDate");
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy. MM. dd");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		// String 타입을 Date 타입으로 변환
		Date checkinDate_format = dtFormat.parse(checkinDate);
		Date checkoutDate_format = dtFormat.parse(checkoutDate);
		
		String petcomment = (String) request.getParameter("petcomment");
		String costResult = (String) request.getParameter("totalcost");
		
		//petserviceTB
		String[] petName = request.getParameterValues("petname");
		String[] petGender = request.getParameterValues("petsex");
		String[] petRoom = request.getParameterValues("petroom");
		String[] petBeauty = request.getParameterValues("beauty");
		String[] petSpa = request.getParameterValues("spa");
		
		
		return null;
		
	}
	
	//id나 예약번호로 예약검색   
	@ResponseBody 
	@RequestMapping(value= "/adminSearchRes.do", method = RequestMethod.POST)
	public List<AdminResFullVO> adminResListById(@RequestBody Map<String,Object> searchMap,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println(searchMap);
		
		Map<String,String> State_ck = (Map<String, String>) searchMap.get("State_ck");
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
		searchOption.put("search_op", (String) searchMap.get("search_op"));
		searchOption.put("index", (String) searchMap.get("index"));
		if(searchMap.get("res_ck")!=null) {
			searchOption.put("res_state", (String) searchMap.get("res_ck"));
		}
		
		if(State_ck.size()<3 || State_ck.size()>0) {
			int i=1;
			for(String key : State_ck.keySet()) {
				searchOption.put("State"+i,State_ck.get(key));
				i++;
			}
		}
		
		System.out.println(searchOption);

		List<AdminResFullVO> searchadminResList; 
		searchadminResList= adminresService.searchResList(searchOption);
		
		return searchadminResList;
	}
	
}

