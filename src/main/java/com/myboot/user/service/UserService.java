package com.myboot.user.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myboot.user.vo.UserVO;

public interface UserService {
	public List listUser() throws Exception;
	public int modMember(UserVO userVO) throws DataAccessException; 
	public int removeMember(String id) throws DataAccessException;
}
