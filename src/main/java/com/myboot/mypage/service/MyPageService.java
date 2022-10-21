package com.myboot.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myboot.reservation.vo.ReservationVO;

public interface MyPageService {
	public List listMyReserve(String user_id) throws Exception;
	public Map listMyDetailReserve(Map paraMap, String colName) throws Exception;
	public List listMyReview(String user_id) throws Exception;
	public void cancelReserve(String res_num) throws Exception;
	
	
}
