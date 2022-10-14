package com.myboot.user.service;

import java.util.List;
import java.util.Map;

import com.myboot.user.vo.UserVO;

public interface UserService {
	public List listUser() throws Exception;
	public UserVO login(Map  loginMap) throws Exception;
//	public String overlapped(String id) throws Exception;
}
