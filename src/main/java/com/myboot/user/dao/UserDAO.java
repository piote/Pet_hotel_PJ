package com.myboot.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.user.vo.UserVO;

@Mapper
@Repository("userDAO")
public interface UserDAO {
	public List selectAllUserList() throws DataAccessException;
	 public int updateMember(UserVO userVO) throws DataAccessException;
	 public int deleteMember(String id) throws DataAccessException;
	 public UserVO password(UserVO userVO) throws DataAccessException;
	 
//	로그인 기능 구현
	public UserVO loginById(UserVO userVO) throws DataAccessException;
//	회원가입 회원정보 추가
	public int insertUser(UserVO userVO) throws DataAccessException;
//	회원가입 id중복 확인ㄴ
	public String selectOverlappedID(String id) throws DataAccessException;
	}

