package com.myboot.admin.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.admin.user.dao.AdminUserDAO;
import com.myboot.user.vo.UserVO;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	//전체 리스트
	@Override
	public List listUsers() throws Exception {
		List usersList = null;
		usersList = adminUserDAO.selectAllUserList();
		return usersList;
	}
	//검색했을때
	@Override
	public List searchUsersOption (Map searchOption) throws Exception{
		List usersList = null;
		usersList = adminUserDAO.searchUsers(searchOption);
		return usersList;
	}
	
	//유저수정
	@Override
	public int UpdateUser(Map userMap) throws Exception{
		return adminUserDAO.adminUpdateUser(userMap);
	}
	
	//활성화
	@Override
	public int activeUserState(String id) throws Exception{
		return adminUserDAO.activeUser(id);
	}
	//탈퇴
	@Override
	public int removeUserState(String id) throws Exception{
		return adminUserDAO.removeUser(id);
	}
	
}
