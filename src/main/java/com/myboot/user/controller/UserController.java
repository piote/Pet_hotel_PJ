package com.myboot.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboot.user.vo.UserVO;

public interface UserController {
	public ModelAndView listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	로그인 기능 구현
	public ModelAndView login(@ModelAttribute("user") UserVO userVO,
            RedirectAttributes  redirectAttributes,
           HttpServletRequest request, HttpServletResponse response) throws Exception;
//	로그아웃 기능 구현
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	회원가입 기능 구현
	public ModelAndView addUser(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
   //	회원가입 id 중복확인 기능     
//	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public int overlappedID(UserVO userVO) throws Exception;
	
  // 비밀번호 한번더 입력
	public ModelAndView pw_change(@RequestParam(value= "password", required=false) String password, RedirectAttributes rAttr, 
				HttpServletRequest request, HttpServletResponse response)  throws Exception;
        
	// 회원 정보 수정
//	public ModelAndView modMember(@ModelAttribute("user") UserVO user, 
//			HttpServletRequest request, HttpServletResponse response) throws Exception;
	@RequestMapping(value="/modMember.do" , method = RequestMethod.POST)
	public ModelAndView modMember(
            @RequestParam(value= "user", required=false) UserVO user,
			RedirectAttributes rAttr, 
				HttpServletRequest request, HttpServletResponse response)  throws Exception;
	// 회원 탈퇴
	public ModelAndView retiring(@RequestParam("id") String id, 
	           HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView removeUser(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 로그인 아이디 찾기
	public String find_id(HttpServletResponse response,@RequestParam("name") String name, @RequestParam("email") String email, Model md) throws Exception;
	
	// 로그인 비밀번호 찾기
	public String find_pw(HttpServletResponse response, @RequestParam("id") String id, @RequestParam("tel") String tel, Model md) throws Exception;
	
		
	public String userMain(Model model);
}
	
	

