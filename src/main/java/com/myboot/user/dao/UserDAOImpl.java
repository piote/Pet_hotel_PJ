package com.myboot.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl  implements UserDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public UserVO login(Map loginMap) throws DataAccessException{
		UserVO user=(UserVO)sqlSession.selectOne("mapper.user.login",loginMap);
	   return user;
	}
//	
//	@Override
//	public String selectOverlappedID(String id) throws DataAccessException {
//		String result =  sqlSession.selectOne("mapper.user.selectOverlappedID",id);
//		return result;
//	}
//
//
	@Override
	public List selectAllUserList() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
