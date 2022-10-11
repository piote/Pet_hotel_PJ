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
}
