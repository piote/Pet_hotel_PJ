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
	public UserVO login(Map loginMap) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public List selectAllUserList() throws DataAccessException;
	
}
