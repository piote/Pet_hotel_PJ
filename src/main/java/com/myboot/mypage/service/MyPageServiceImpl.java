package com.myboot.mypage.service;

import java.util.HashMap;
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

	@Override
	public Map listMyDetailReserve(Map paraMap, String searchWord) throws Exception{
		Map myReserveMap = new HashMap();
		List myReserveList = null;
		int totReserves=0;
		if(searchWord==null || searchWord=="") {
			myReserveList = myPageDAO.selectAllMyReservesList(paraMap);
			totReserves = myPageDAO.selectTotReserves();
		} 
		else {
			paraMap.put("searchWord", searchWord);
			myReserveList = myPageDAO.selectMyDetailReservesList(paraMap);
			myReserveMap.put("searchWord", searchWord);
			totReserves = myPageDAO.searchTotReserves(searchWord);
		}
		myReserveMap.put("myReserveList", myReserveList);
		myReserveMap.put("totReserves",totReserves );
		return myReserveMap;
	}
	
	@Override
	public List listMyReview(String user_id) throws Exception{
		return myPageDAO.selectMyReviewList(user_id);
	}
	
	@Override
	public void cancelReserve(String res_num) throws Exception{
		myPageDAO.updateMyReserveCancel(res_num);
	}
}
