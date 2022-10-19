package com.myboot.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboot.user.vo.UserVO;

public interface UserController {
//	로그인 기능 구현
	public ModelAndView login(@ModelAttribute("user") UserVO userVO,
            RedirectAttributes  redirectAttributes,
           HttpServletRequest request, HttpServletResponse response) throws Exception;
//	로그아웃 기능 구현
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	회원가입 기능 구현
	public ModelAndView addUser(@ModelAttribute("info") UserVO userVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	회원가입 id 중복확인 기능
	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView pw_change(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String userMain(Model model);
}
