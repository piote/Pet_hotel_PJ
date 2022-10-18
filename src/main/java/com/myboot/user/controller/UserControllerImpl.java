package com.myboot.user.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
//	로그인창
	@Override
	@RequestMapping(value = "/login.do", method =  RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") UserVO user,
			                  RedirectAttributes  rAttr,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(user);
		userVO = userService.login(user);
		if(userVO!= null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userVO);
			session.setAttribute("isLogOn", true);
			
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			
			if(action!= null) {
				mav.setViewName("redirect:"+action);
			}else {
				mav.setViewName("redirect:/main.do");	
			}
			
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/loginForm.do");
		}
		
		
		return mav;
	}
//	로그아웃 기능추가
	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.setAttribute("isLogOn",false);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	
	
//	@RequestMapping("/userForm.do")
//	  public String userForm(Model model){
//		return "/userForm";
//	  }
	@RequestMapping(value= "/userForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
		
	}
	
////	회원가입 회원추가
//	@Override
//	@RequestMapping(value="/addUser.do" ,method = RequestMethod.POST)
//	public ResponseEntity addUser(@ModelAttribute("userVO") UserVO _userVO,
//			                HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html; charset=UTF-8");
//		request.setCharacterEncoding("utf-8");
//		String message = null;
//		ResponseEntity resEntity = null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//		    userService.addUser(_userVO);
//		    message  = "<script>";
//		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.�α���â���� �̵��մϴ�.');";
//		    message += " location.href='"+request.getContextPath()+"/loginForm.do';";
//		    message += " </script>";
//		    
//		}catch(Exception e) {
//			message  = "<script>";
//		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
//		    message += " location.href='"+request.getContextPath()+"/userForm.do';";
//		    message += " </script>";
//			e.printStackTrace();
//		}
//		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
//		return resEntity;
//	}
//	회원가입 id 중복 확인 기능
	@Override
	@RequestMapping(value="/overlapped.do",method=RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		ResponseEntity resEntity= null;
		String result = userService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	//myboot3에서 *form을 그대로 들고왔습니다.
	@RequestMapping(value = "/loginForm.do", method =  RequestMethod.GET) 
	  public ModelAndView form(@RequestParam(value= "result", required=false) String result,
					              @RequestParam(value= "action", required=false) String action,
					              HttpServletRequest request, 
					              HttpServletResponse response) throws Exception {
				String viewName = (String)request.getAttribute("viewName");
				HttpSession session = request.getSession();
				session.setAttribute("action", action); 
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("result",result);
				mav.setViewName(viewName);
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
	
	// 비밀번호 한번 더 입력
//	@Override
//	@RequestMapping(value="/pw_change.do" ,method = RequestMethod.GET)
//	public ModelAndView pw_change(HttpServletRequest request, HttpServletResponse response)  throws Exception {
//		HttpSession session=request.getSession();
//		session=request.getSession();
//		
//		String viewName=(String)request.getAttribute("viewName");
//		ModelAndView mav = new ModelAndView(viewName);
//		return mav;
//    }
	
	// 한번 더 비밀번호 입력
	@Override
	@RequestMapping(value="/pw_change.do" ,method = RequestMethod.GET)
	public ModelAndView pw_change(RedirectAttributes rAttr, 
				HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		
		if(userVO!= null) {
			HttpSession session = request.getSession();
			userVO = (UserVO) session.getAttribute("user");
			System.out.println(userVO);
			userVO = userService.password(userVO);
			
			//mav.setViewName("redirect:/pw_change.do");	
			
			String viewName=(String)request.getAttribute("viewName");
			mav = new ModelAndView(viewName);
			return mav;
			
		}else {
			rAttr.addAttribute("result","passwordFailed");
			mav.setViewName("redirect:/modMember.do");
		}
		
		return mav;
	}
	
	// 탈퇴하기
	@Override
	@RequestMapping(value="removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		userService.removeMember(id);
		mav.setViewName("redirect:/main.do");
		return mav;
	}
}

