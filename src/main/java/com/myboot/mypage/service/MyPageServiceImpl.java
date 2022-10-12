package com.myboot.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.mypage.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public List listMyReserve(String user_id) throws Exception{
		return myPageDAO.selectMyReservesList(user_id);
	}

//	@Override
//	public Map listMyReserve(Map paraMap) throws Exception{
//		return myPageDAO.selectMyReservesList(paraMap);
//	}
	
//	@Override
//	public List<ReserveVO> listMyReview(String user_id) throws Exception{
//		return myPageDAO.selectMyReviewList(user_id);
//	}
	
}
