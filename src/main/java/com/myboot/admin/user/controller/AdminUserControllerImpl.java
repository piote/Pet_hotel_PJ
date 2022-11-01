package com.myboot.admin.user.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.admin.user.service.AdminUserService;
import com.myboot.user.service.UserService;
import com.myboot.user.vo.UserVO;

@Controller("adminUserController")
public class AdminUserControllerImpl implements AdminUserController {
	
	@Autowired
	private UserVO userVO;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private UserService userService;
	
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
	
//	@Override
//	@RequestMapping("/admin/adminResList.do")
//	public ModelAndView ResList(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		userVO = (UserVO) session.getAttribute("user");
//		
//		response.setCharacterEncoding("EUC-KR");
//		if(userVO!=null) {
//			System.out.println(userVO);
//			System.out.println(userVO.getId());
//			
//			if(userVO.getId().equals("admin")) {
//				System.out.println("관리자");
//				mav.setViewName("/admin/adminResList");
//				return mav;
//			}
//		}
//
//		
//		PrintWriter writer = response.getWriter();
//		writer.println("<script type='text/javascript'>");
//		writer.println("alert('권한이 없습니다.');");
//		writer.println("history.back();");
//		writer.println("</script>");
//		writer.flush();
//		return null;
//		
//	}
	
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
	@RequestMapping(value= "/adminSearchUser.do", method = RequestMethod.POST)
	public List<UserVO> adminUserListById(@RequestBody Map<String,Object> searchMap,
			  HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println(searchMap);
		
		Map<String,String> grade_ck = (Map<String, String>) searchMap.get("grade_ck");
		
		Map<String, String> searchOption = new HashMap<String, String>();
		
		searchOption.put("search_op", (String) searchMap.get("search_op"));
		searchOption.put("keyword", (String) searchMap.get("keyword"));
		if(searchMap.get("res_ck")!=null) {
			searchOption.put("res_state", (String) searchMap.get("res_ck"));
		}
		
		if(grade_ck.size()<4 || grade_ck.size()>0) {
			int i=1;
			for(String key : grade_ck.keySet()) {
				searchOption.put("grade"+i,grade_ck.get(key));
				i++;
			}
		}
		
		System.out.println(searchOption);

		List<UserVO> searchUsers; 
		searchUsers= adminUserService.searchUsersOption(searchOption);
		
		return searchUsers;
	}
	
	
	
	@ResponseBody 
	@RequestMapping(value="/adminModUser.do" ,method = RequestMethod.POST)
	public List<UserVO> adminModMember(@ModelAttribute("user") UserVO user, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
    		
		int result = 0;
		String birth=request.getParameter("birth_string");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = dtFormat.parse(birth);
		user.setBirth(formatDate);

		if(user.getMessage()==null || user.getMessage()==""){
			user.setMessage("N");
			System.out.println("N");
		}
		
		System.out.println(user);
		
		result = adminUserService.UpdateUser(user);
		
		System.out.println(result);
		
		List<UserVO> allUser =  adminUserService.listUsers();
		return allUser;
	}
	
	@ResponseBody 
	@RequestMapping(value="/adminRemoveUser.do" ,method = RequestMethod.POST)
	public List<UserVO> adminRemoveUser(@RequestParam("id") String id, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
    		
		int result = 0;
		result = userService.retiring(id);
		
		System.out.println(result);
		
		List<UserVO> allUser =  adminUserService.listUsers();
		return allUser;
	}
	
}
