package com.myboot.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.mypage.dao.MyPageDAO;
import com.myboot.reservation.vo.ReservationVO;
import com.myboot.review.vo.ReviewVO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public List<ReservationVO> listMyReserve(String user_id) throws Exception{
		return myPageDAO.selectMyReservesList(user_id);
	}

	@Override
	public Map listMyDetailReserve(Map paraMap, String startDate, String endDate) throws Exception{
		Map myReserveMap = new HashMap();
		List<ReservationVO> myReserveList = null;
		int totReserves=0;
		if((startDate==null || startDate=="") && (endDate==null || endDate=="")) {
			myReserveList = myPageDAO.selectAllMyReservesList(paraMap);
			totReserves = myPageDAO.selectTotReserves(paraMap);
		} 
		else {
			myReserveList = myPageDAO.selectMyDetailReservesList(paraMap);
			totReserves = myPageDAO.searchTotReserves(paraMap);
		}
		myReserveMap.put("myReserveList", myReserveList);
		myReserveMap.put("totReserves",totReserves );
		return myReserveMap;
	}
	
	@Override
	public List<ReviewVO> listMyReview(String user_id) throws Exception{
		return myPageDAO.selectMyReviewList(user_id);
	}
	
	@Override
	public void cancelReserve(String res_num) throws Exception{
		myPageDAO.updateMyReserveCancel(res_num);
	}
}
