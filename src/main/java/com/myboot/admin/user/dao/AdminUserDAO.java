package com.myboot.admin.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.user.vo.UserVO;

@Mapper
@Repository("adminUserDAO")
public interface AdminUserDAO {	
	public List selectAllUserList() throws DataAccessException;
	public List searchUsers(Map searchOption) throws DataAccessException;
	public int adminUpdateUser(Map userMap) throws DataAccessException;
	public int removeUser(String id) throws DataAccessException;
	public int activeUser(String id) throws DataAccessException;
}
