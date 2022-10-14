package com.myboot.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.user.dao.UserDAO;
import com.myboot.user.vo.UserVO;

@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List listUser() throws Exception {
		List userList = null;
		userList = userDAO.selectAllUserList();
		return userList;
	}
	@Override
	public UserVO login(Map  loginMap) throws Exception{
		return userDAO.login(loginMap);
	}
//	@Override
//	public String overlapped(String id) throws Exception{
//		return userDAO.selectOverlappedID(id);
//	}

}
