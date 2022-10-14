package com.myboot.user.service;

import java.util.List;
import java.util.Map;

import com.myboot.user.vo.UserVO;

public interface UserService {
	public UserVO login(UserVO userVO) throws Exception;
	public List listUser() throws Exception;
}
