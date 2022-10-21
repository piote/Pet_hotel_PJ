package com.myboot.user.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
	
	
	public List listUsers() throws Exception {
		List usersList = null;
		usersList = userDAO.selectAllUserList();
		return usersList;
	}
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

// 로그인 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = userDAO.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	

  // 회원 정보 수정
	@Override
	public int modMember(UserVO userVO) throws DataAccessException {
	    return userDAO.updateUser(userVO);
	}
	
	@Override
	public UserVO findUser(String id) throws DataAccessException{
		return userDAO.selectUserById(id);
	}
  
  // 회원 탈퇴
	@Override
	public int retiring(String id) throws DataAccessException {
		return  userDAO.deleteUser(id);
	}
	
 // 비밀번호 한번 더 입력
	
	@Override
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
		return userDAO.insertNewUser(user);
	}
// 로그인 아이디 찾기
}
