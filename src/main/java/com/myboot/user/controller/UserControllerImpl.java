package com.myboot.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
			List userList = userService.listUsers();
			
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
	@Override
	@RequestMapping(value= "/listUsers.do", method = RequestMethod.GET)
	public ModelAndView listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//public String listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String)request.getAttribute("viewName");
		List usersList = userService.listUsers();
		//ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("/user/listMembers");
		
		mav.addObject("usersList", usersList);
		return mav;
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
	@RequestMapping(value = "/find_id_form.do")
	public ModelAndView find_id_form(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
////	회원가입 회원추가
	@Override
	@RequestMapping(value = "/addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
		request.setCharacterEncoding("utf-8");
		int result = 0;
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		String tel_sub=request.getParameter("tel_sub");
		String message=request.getParameter("message");
		String birth=request.getParameter("birth");
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date formatDate = dtFormat.parse(birth);
		System.out.println(birth);
		
		
		UserVO userVO= new UserVO();
		userVO.setId(id);
		userVO.setPw(pw);
		userVO.setName(name);
		userVO.setEmail(email);
		userVO.setTel(tel);
		userVO.setTel_sub(tel_sub);
		userVO.setMessage(message);
		if(message==null || message==""){
			userVO.setMessage("N");
			System.out.println("N");
		}
		userVO.setBirth(formatDate);
		System.out.println(userVO.getId()+userVO.getPw()+userVO.getName()+userVO.getEmail()+userVO.getTel()+userVO.getTel_sub()+userVO.getMessage()+userVO.getBirth());
		result = userService.addUser(userVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
		
	}

//	회원가입 id 중복 확인 기능
	 @ResponseBody // 값 변환을 위해 꼭 필요함
		@GetMapping("idCheck") // 아이디 중복확인을 위한 값으로 따로 매핑
		public int overlappedID(UserVO userVO) throws Exception{
			int result = userService.overlappedID(userVO); // 중복확인한 값을 int로 받음
			return result;
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
//	로그인 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", userService.find_id(response, email));
		return "/find_id";
	}
	// 한번 더 비밀번호 입력 폼
	@RequestMapping(value = "/pw_changeForm.do", method =  RequestMethod.GET)
	private ModelAndView Form(@RequestParam(value= "result", required=false) String result,
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
	
	// 한번 더 비밀번호 입력
	@Override
	@RequestMapping(value="/pw_change.do" , method = RequestMethod.POST)
	public ModelAndView pw_change(
            @RequestParam(value= "password", required=false) String password,
			RedirectAttributes rAttr, 
				HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		
			HttpSession session = request.getSession();
			userVO = (UserVO) session.getAttribute("user");
			System.out.println(userVO);
			System.out.println(password);
			System.out.println(userVO.getPw());
			//userVO = userService.password(userVO);
			String userPw =userVO.getPw();
			
			if (userPw.equals(password)) {
				System.out.println("성공");
				
				mav.setViewName("redirect:/modMember.do");	
			
				//String viewName=(String)request.getAttribute("viewName");
				//mav = new ModelAndView(viewName);
				
			}else {
				rAttr.addAttribute("result","passwordFailed");
				mav.setViewName("redirect:/pw_changeForm.do");
				System.out.println("실패");
			}
		return mav;
			
	}
	
	// 회원 정보 수정
		@Override
		@RequestMapping(value="/modMember.do" ,method = RequestMethod.GET)
		public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response)  throws Exception {
			HttpSession session=request.getSession();
			session=request.getSession();
			
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
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

