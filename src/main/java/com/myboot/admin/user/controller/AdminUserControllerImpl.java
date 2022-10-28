package com.myboot.admin.user.controller;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.user.service.AdminUserService;
import com.myboot.user.vo.UserVO;

@Controller("adminUserController")
public class AdminUserControllerImpl implements AdminUserController {
	
	@Autowired
	private UserVO userVO;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Override
	@RequestMapping("/admin/adminUserList.do")
	  public ModelAndView UserList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		userVO = (UserVO) session.getAttribute("user");
		
		response.setCharacterEncoding("EUC-KR");
		if(userVO!=null) {
			System.out.println(userVO);
			System.out.println(userVO.getId());
			
			if(userVO.getId().equals("admin")) {
				System.out.println("관리자");
				mav.setViewName("/admin/adminUserList");
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
	
	@Override
	@RequestMapping("/admin/adminResList.do")
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
	
	@RequestMapping("/admin/adminResListT.do")
	public ModelAndView ResListT(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("관리자");
		mav.setViewName("/admin/adminResListT");
		return mav;
		
	}
	@ResponseBody 
	@RequestMapping(value= "/returnAllUser.do", method = RequestMethod.GET)
	public List<UserVO> returnAllUser() throws Exception{
		List<UserVO> allUser =  adminUserService.listUsers();
		return allUser;
	}
	@ResponseBody 
	@RequestMapping(value= "/adminSearchUser.do", method = RequestMethod.GET)
	public List<UserVO> adminUserListById(
			@RequestParam(value ="search_op", required = false) String search_op,
			@RequestParam(value ="keyword", required = false) String keyword,
			@RequestParam(value ="Bronze", required = false) String bronze,
			@RequestParam(value ="Silver", required = false) String silver,
			@RequestParam(value ="Gold", required = false) String gold,
			@RequestParam(value ="res_O", required = false) String res_O,
			@RequestParam(value ="res_X", required = false) String res_X,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
		searchOption.put("search_op", search_op);
		searchOption.put("keyword", keyword);
		if(bronze!=null && bronze!="" && silver!=null && silver!="" && gold!=null && gold!="") {
			
		}else if(bronze!=null && bronze!="" && silver!=null && silver!="") {
			searchOption.put("grade", bronze);
			searchOption.put("grade2", silver);
		}else if(bronze!=null && bronze!="" && gold!=null && gold!="") {
			searchOption.put("grade", bronze);
			searchOption.put("grade2", gold);
		}else if(silver!=null && silver!="" && gold!=null && gold!="") {
			searchOption.put("grade", silver);
			searchOption.put("grade2", gold);
		}else if(bronze!=null && bronze!="") {
			searchOption.put("grade", bronze);
		}else if(silver!=null && silver!="") {
			searchOption.put("grade", silver);
		}else if(gold!=null && gold!="") {
			searchOption.put("grade", gold);
		}
		
		if(res_O!=null && res_O!="" && res_X!=null && res_X!="") {
			
		}else if(res_O!=null && res_O!="") {
			searchOption.put("res_state", res_O);
		}else if(res_X!=null && res_X!="") {
			searchOption.put("res_state", res_X);
		}
		
		List<UserVO> searchUsers; 
		searchUsers= adminUserService.searchUsersOption(searchOption);
		
		return searchUsers;
	}
	
}
