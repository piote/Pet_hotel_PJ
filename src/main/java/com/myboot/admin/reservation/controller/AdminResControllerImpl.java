package com.myboot.admin.reservation.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
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
import com.myboot.reservation.service.ReservationService;
import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.user.vo.UserVO;

@Controller("adminresController")
public  class AdminResControllerImpl implements AdminResController{

	private static final String String = null;
	@Autowired
	private AdminResService adminresService;
	
	@Autowired
	private ReservationService resService;
	
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
	@Override
	@ResponseBody
	@RequestMapping(value= "/admin/adminResList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ResReed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user")==null || request.getHeader("REFERER") == null) {
			request.setAttribute("stmsgcheck", "1");
			request.setAttribute("stmsg", "비정상적인 접근입니다!");
			mav.setViewName("forward:/main.do");
			return mav;
		}
		
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
	@Override
	@RequestMapping(value= "/ResPageAjax.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ResPageAjax(@RequestBody Map<String,Object> searchMap, Model model) throws Exception {

		int Page = (int) searchMap.get("P");
		
		Map<String,String> state_ck = (Map<String, String>) searchMap.get("state_ck");
		Map<String, String> searchOption = new HashMap<String, String>();
		
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
		
		List<AdminResFullVO> searchadminResList; 
		searchadminResList= adminresService.searchResList(searchOption);
		
	    model.addAttribute("list", searchadminResList);
	    model.addAttribute("P", Page);
	   
	    return "/page/ResPageAjax";
	  }
	
	//예약 번호로 예약 찾기
	@Override
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
	
	@Override
	@ResponseBody 
	@RequestMapping(value= "/ReservaitionCheckY.do", method = RequestMethod.POST)
	public String ReservaitionCheck(
			@RequestParam(value ="res_num", required = false) String res_num,
			@RequestParam(value ="user_Id", required = false) String user_Id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
				
		System.out.println(res_num);

		//예약 확인 변경
		adminresService.updateResStateY(res_num);

		//맴버쉽 상승
		//변경-> 유저 id로 예약 횟수 조회후 그에 맞춰 맴버십 변환
		
		adminresService.userMembershipUpdate(user_Id);
	
		return res_num;
	}
	
	@Override
	@ResponseBody 
	@RequestMapping(value= "/ReservaitionCheckC.do", method = RequestMethod.POST)
	public String ReservaitionCheck2(
			@RequestParam(value ="res_num", required = false) String res_num,
			@RequestParam(value ="user_Id", required = false) String user_Id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
				
		System.out.println(res_num);

		//예약 취소 변경
		adminresService.updateResStateC(res_num);

		return res_num;
	}

	@Override
	@ResponseBody 
	@RequestMapping(value= "/adminResUpdate.do", method = {RequestMethod.POST})
	public String adminReservationUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//유저 정보
		
		String user_Id = request.getParameter("user_Id");

		//날짜 포맷
		String checkinDate = request.getParameter("res_st");//스트링 데이터로 변환하기 포멧
		String checkoutDate = request.getParameter("res_end");//
		
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
		// String 타입을 Date 타입으로 변환
		Date checkinDate_format = newDtFormat.parse(checkinDate);
		Date checkoutDate_format = newDtFormat.parse(checkoutDate);
		// 예약 정보
		String StresNum = request.getParameter("res_num");
		int resNum = Integer.parseInt(StresNum);
		
		String petcomment = request.getParameter("pet_Comment");
		String costResult = request.getParameter("view_TotalCost");
		
		//petserviceTB ajax array 는 []를 붙여야함
		String[] petName = request.getParameterValues("petname[]");
		String[] petGender = request.getParameterValues("petsex[]");
		String[] petRoom = request.getParameterValues("petroom[]");
		String[] petBeauty = request.getParameterValues("beauty[]");
		String[] petSpa = request.getParameterValues("spa[]");

		//pet서비스 vo List만들기
		List<PetserviceVO> petServiceList = new ArrayList<PetserviceVO>();

		for(int i=0;i<petName.length;i++) {
			
			if(petName[i] != null && petName[i] != "") {
				
				PetserviceVO petserVO = new PetserviceVO();
				petserVO.setRes_num(resNum);
				petserVO.setId(user_Id);
				petserVO.setPet_name(petName[i]);
				petserVO.setPet_gender(petGender[i]);
				petserVO.setRoom_grade(petRoom[i]);
				petserVO.setService_beauty(petBeauty[i]);
				petserVO.setService_spa(petSpa[i]);
				//test
				System.out.println(petserVO);
				//add
				petServiceList.add(petserVO);
		
			}
		}
		
		ReservationVO reserVO = new ReservationVO();
		//예약 vo
		reserVO.setRes_num(resNum);
		reserVO.setRes_st(checkinDate_format);
		reserVO.setRes_end(checkoutDate_format);
		reserVO.setRes_comment(petcomment);
		reserVO.setTotalCost(costResult);
		
		//데이터 베이스
		resService.updateReservation(reserVO);
		//삭제
		resService.deletePetserviceList(StresNum);
		//이후 삽입
		resService.addPetService(petServiceList);

		return "1234";
	}	
	
}

