package com.myboot.admin.user.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@ResponseBody 
	@RequestMapping(value= "/returnAllUser.do", method = RequestMethod.GET)
	public List<UserVO> returnAllUser() throws Exception{
		List<UserVO> allUser =  adminUserService.listUsers();
		return allUser;
	}
	
}
