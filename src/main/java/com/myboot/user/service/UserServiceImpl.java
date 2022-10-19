package com.myboot.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
//	로그인
	public UserVO login(UserVO userVO) throws Exception{
		System.out.println(userDAO.loginById(userVO));
		return userDAO.loginById(userVO);
	}
	public List listUser() throws Exception {
		List userList = null;
		userList = userDAO.selectAllUserList();
		return userList;
	}
  // 회원 정보 수정
	
	public int modMember(UserVO userVO) throws DataAccessException {
	    return userDAO.updateMember(userVO);
	}
  
  // 회원 탈퇴
	
	public int removeMember(String id) throws DataAccessException {
		return  userDAO.deleteMember(id);
	}
	
 // 비밀번호 한번 더 입력
	
	public UserVO password(UserVO  userVO) throws Exception{
		return userDAO.password(userVO);
	}

// 회원가입 아이디 중복 확인
	public int overlappedID(UserVO userVO) throws Exception{
		int result =userDAO.overlappedID(userVO);
		return result;
	}
//	회원가입 회원정보 추가
	
	public int addUser(UserVO user) throws Exception {
		return userDAO.insertUser(user);
	}
}
