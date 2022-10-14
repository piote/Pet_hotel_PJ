package com.myboot.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.common.base.BaseController;
import com.myboot.user.service.UserService;
import com.myboot.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value="/user")
public class UserControllerImpl extends BaseController implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String>loginMap, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mav = new ModelAndView();
		 userVO=userService.login(loginMap);
		if(userVO!= null && userVO.getId()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("userInfo",userVO);
			mav.setViewName("redirect:/main.do");
	}else{
		String message="다시 입력해주십시오";
		mav.addObject("message", message);
		mav.setViewName("/user/loginForm");
	}
	return mav;
}
	@ResponseBody
	@RequestMapping("/user.do") 
	public String userMain(Model model){
		String a= "";
		try {
			List userList = userService.listUser();
			
			  int totalElements = userList.size();

			for(int i=0;i<userList.size();i++) {
				UserVO vo = (UserVO) userList.get(i);
				a += vo.getId()+" ";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	@RequestMapping("/loginForm.do") 
//	  public String reservationMain(Model model){
	public String loginnMain(Model model){
	    return "loginForm"; 
	  }

	
// 로그아웃 기능 구현
//	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
//	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session=request.getSession();
//		session.setAttribute("isLogOn", false);
//		session.removeAttribute("userInfo");
//		mav.setViewName("redirect:/main/main.do");
//		return mav;
//	}
// id 중복검사 기능 구현
//	@Override
//	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
//	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ResponseEntity resEntity = null;
//		String result = userService.overlapped(id);
//		resEntity =new ResponseEntity(result, HttpStatus.OK);
//		return resEntity;
//	}
//	회원가입 기능
	@Override
	@RequestMapping(value="/addUser.do" ,method = RequestMethod.POST)
	public ResponseEntity addUser(@ModelAttribute("userVO") UserVO _userVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    userService.addUser(_userVO);
		    message  = "<script>";
		    message +=" alert('회원가입을 축하드립니다..');";
		    message += " location.href='"+request.getContextPath()+"/user/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('다시 입력해주세요');";
		    message += " location.href='"+request.getContextPath()+"/user/userForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/pw_change.do" ,method = RequestMethod.GET)
	public ModelAndView pw_change(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
    }
	
	@Override
	@RequestMapping(value="/modMember.do" ,method = RequestMethod.GET)
	public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}

