package com.myboot.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.user.vo.UserVO;

@Mapper
@Repository("userDAO")
public interface UserDAO {
	 public List selectAllUserList() throws DataAccessException;
	 //비밀번호 폼
	 public UserVO password(UserVO userVO) throws DataAccessException;
	 
	 // 회원 정보 수정
	 public int updateUser(Map user) throws DataAccessException;
	 
	 // 회원 탈퇴
	 public int deleteUser(String id) throws DataAccessException;
	 

	 
//	로그인 기능 구현
	public UserVO loginById(UserVO userVO) throws DataAccessException;
//  로그인 아이디 찾기
	public String find_id(UserVO userVO) throws DataAccessException;
//  로그인 비밀번호 찾기
	public String find_pw(UserVO userVO) throws DataAccessException;
//	회원가입 회원정보 추가
	public int insertNewUser(UserVO userVO) throws DataAccessException;
//	회원가입 id중복 확인
	public int overlappedID(UserVO userVO) throws Exception;
	}

