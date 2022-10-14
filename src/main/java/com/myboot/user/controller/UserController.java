package com.myboot.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myboot.user.vo.UserVO;

public interface UserController {
//	로그인
	public ModelAndView login(@RequestParam Map<String, String>loginMap, HttpServletRequest request, HttpServletResponse response)throws Exception;
//	로그아웃
//	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
//	id 중복 검사
//	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	회원가입
	public ResponseEntity addUser(@ModelAttribute("userVO") UserVO _userVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView pw_change(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String userMain(Model model);
}
