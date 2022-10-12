package com.myboot.mypage.service;

import java.util.List;

public interface MyPageService {
	public List listMyReserve(String user_id) throws Exception;
//	public Map listMyReserve(Map paraMap) throws Exception;
//	public List<ReserveVO> listMyReview() throws Exception;
	public void cancelReserve(String reservation_num) throws Exception;
	
}
