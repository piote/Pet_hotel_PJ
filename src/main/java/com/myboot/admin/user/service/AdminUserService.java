package com.myboot.admin.user.service;

import java.util.List;
import java.util.Map;

import com.myboot.user.vo.UserVO;

public interface AdminUserService {
	public List listUsers() throws Exception;
	public List searchUsersOption (Map searchOption) throws Exception;
	public int UpdateUser(Map userMap) throws Exception;
	public int activeUserState(String id) throws Exception;
	public int removeUserState(String id) throws Exception;
}
