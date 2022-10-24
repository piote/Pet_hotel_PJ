package com.myboot.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.admin.user.dao.AdminUserDAO;

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
	@Override
	public List searchUsersById(String keyword) throws Exception {
		List usersList = null;
		usersList = adminUserDAO.searchIdUserList(keyword);
		return usersList;
	}
	@Override
	public List searchUsersByName(String keyword) throws Exception {
		List usersList = null;
		usersList = adminUserDAO.searchNameUserList(keyword);
		return usersList;
	}
	@Override
	public List searchUsersByTel(String keyword) throws Exception {
		List usersList = null;
		usersList = adminUserDAO.searchTelUserList(keyword);
		return usersList;
	}
	@Override
	public List searchUsersByEmail(String keyword) throws Exception {
		List usersList = null;
		usersList = adminUserDAO.searchEmailUserList(keyword);
		return usersList;
	}
}
