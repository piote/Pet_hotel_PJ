package com.myboot.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public List listMyReserve(String user_id) throws Exception;
	public Map listMyReserve(Map paraMap) throws Exception;
	public List listMyReview(String user_id) throws Exception;
	public void cancelReserve(String reservation_num) throws Exception;
	
}
