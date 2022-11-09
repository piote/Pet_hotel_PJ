package com.myboot.admin.reservation.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.reservation.service.AdminResService;
import com.myboot.admin.reservation.vo.AdminPetserviceVO;
import com.myboot.admin.reservation.vo.AdminResFullVO;
import com.myboot.admin.reservation.vo.AdminReservationVO;
import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.user.vo.UserVO;

@Controller("adminresController")
public  class AdminResControllerImpl implements AdminResController{

	private static final String String = null;
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
		
	
	//예약 불러오기       
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
		
		mav.addObject("adminResReed",adminResReed);  //
		
		String  viewName= (String)request.getAttribute("viewName");   //페이지 이동
		mav.setViewName(viewName);
		
		return mav;   //

	}
		
	@RequestMapping(value= "/ResPageAjax.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ResPageAjax(@RequestBody Map<String,Object> searchMap, Model model) throws Exception {
		//@ModelAttribute("P") String Page
		//List<AdminResFullVO> adminResReed = adminresService.adminAllResList();
		
		System.out.println(searchMap); 
		
		int Page = (int) searchMap.get("P");
		
		Map<String,String> state_ck = (Map<String, String>) searchMap.get("state_ck");
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
//		Map<String, String> resst_up = new HashMap<String, String>();
		
		searchOption.put("search_op", (String) searchMap.get("search_op"));
		searchOption.put("sort_ck", (String) searchMap.get("sort_ck"));
		searchOption.put("keyword", (String) searchMap.get("keyword"));
		
		
		if(state_ck.size()<4 || state_ck.size()>0) {
			int i=1;
			for(String key : state_ck.keySet()) {
				searchOption.put("state"+i,state_ck.get(key));
				i++;
			}
		}
		System.out.println(searchOption);
		
		//List list = adminresService.adminAllResList();  
		List<AdminResFullVO> searchadminResList; 
		searchadminResList= adminresService.searchResList(searchOption);
		
	    model.addAttribute("list", searchadminResList);
	    model.addAttribute("P", Page);
	   
	    return "/page/ResPageAjax";
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
		
		Map<String,String> state_ck = (Map<String, String>) searchMap.get("state_ck");
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
		searchOption.put("search_op", (String) searchMap.get("search_op"));
		searchOption.put("keyword", (String) searchMap.get("keyword"));
		
		if(state_ck.size()<4 || state_ck.size()>0) {
			int i=1;
			for(String key : state_ck.keySet()) {
				searchOption.put("state"+i,state_ck.get(key));
				i++;
			}
		}
		
		System.out.println(searchOption);

		List<AdminResFullVO> searchadminResList; 
		searchadminResList= adminresService.searchResList(searchOption);
		
		return searchadminResList;
	}
	
	//예약 번호로 예약 찾기 
	@ResponseBody 
	@RequestMapping(value= "/SearchReservationNum.do", method = RequestMethod.POST)
	public HashMap SearchReservationNum(
			@RequestParam(value ="reserNum", required = false) String reserNum,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
			
		AdminResFullVO reser; 
		List<AdminResFullVO> reserP; 
		
		reser =  adminresService.SearchReservationNum(reserNum);
		reserP = adminresService.SearchPetServiceByResNum(reserNum);
		
		HashMap reservationMap = new HashMap();
		
		reservationMap.put("reservation", reser);//예약 테이블
		reservationMap.put("petservice", reserP);//펫 서비스 테이블 들
		
		return reservationMap;
	}
	
}

