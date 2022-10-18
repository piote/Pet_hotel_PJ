package com.myboot.mypage.service;

import java.util.List;
import java.util.Map;

import com.myboot.reservation.vo.ReservationVO;

public interface MyPageService {
	public List listMyReserve(String user_id) throws Exception;
	public List listMyReserve(Map paraMap) throws Exception;
	public List listMyReview(String user_id) throws Exception;
	public void cancelReserve(String reservation_num) throws Exception;
	
}
