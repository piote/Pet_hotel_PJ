package com.myboot.user.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.myboot.user.vo.UserVO;

public interface UserService {
//	로그인 기능
	public UserVO login(UserVO userVO) throws Exception;
	
	public List listUsers() throws Exception;

// 로그인 아이디 찾기
	public String find_id(HttpServletResponse response, UserVO userVO) throws Exception;
	
// 로그인 비밀번호 찾기
	public String find_pw(HttpServletResponse response, UserVO userVO) throws Exception;
	
// 비밀번호 한번 더 입력
	public UserVO password(UserVO  userVO) throws Exception;
//public UserVO pwUser(String pw) throws DataAccessException;
		
// 회원 정보 수정
	public int modMember(UserVO userVO) throws DataAccessException; 
	
//	public UserVO findUser(UserVO user) throws DataAccessException;
	
// 회원 탈퇴	
	public int retiring(String id) throws DataAccessException;
	
//	회원가입 회원정보 추가
	public int addUser(UserVO userVO) throws Exception;
//	회원가입 아이디중복 검사 기능
	 public int overlappedID(UserVO userVO) throws Exception;
	
}
	
