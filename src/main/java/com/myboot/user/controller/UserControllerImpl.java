package com.myboot.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.user.service.UserService;
import com.myboot.user.vo.UserVO;

@Controller("userController")
public class UserControllerImpl implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;
		
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
//	로그인 기능 구현
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String,String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		userVO = userService.login(loginMap);
		if(userVO!= null&& userVO.getId()!=null) {
			HttpSession session =request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("userInfo",userVO);
			mav.setViewName("redirect:/main.do");
			
		}else {
			String message="아이디나 비밀번호가 틀립니다. 다시 로그인 해주세요";
			 mav.addObject("message",message);
			 mav.setViewName("redirect:/user/loginForm");
			 
		}
		return mav;
	}
// 로그아웃 기능 구현
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("userInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
// id 중복검사 기능 구현
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = userService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
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

