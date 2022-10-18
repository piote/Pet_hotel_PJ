package com.myboot.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myboot.user.vo.UserVO;

import org.springframework.dao.DataAccessException;

import com.myboot.user.vo.UserVO;

public interface UserService {
//	로그인 기능
	public UserVO login(UserVO userVO) throws Exception;
	public List listUser() throws Exception;
	public int modMember(UserVO userVO) throws DataAccessException; 
	public int removeMember(String id) throws DataAccessException;
//	회원가입 회원정보 추가
	public int addUser(UserVO userVO) throws Exception;
//	회원가입 아이디중복 검사 기능
	public String overlapped(String id) throws Exception;
	}
