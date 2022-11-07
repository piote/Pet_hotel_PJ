package com.myboot.mypage.service;

import java.util.List;
import java.util.Map;

import com.myboot.reservation.vo.ReservationVO;
import com.myboot.review.vo.ReviewVO;

public interface MyPageService {
	public List<ReservationVO> listMyReserve(String user_id) throws Exception;
	public Map listMyDetailReserve(Map paraMap, String startDate, String endDate) throws Exception;
	public List<ReviewVO> listMyReview(String user_id) throws Exception;
	public void cancelReserve(String res_num) throws Exception;
	
	
}
