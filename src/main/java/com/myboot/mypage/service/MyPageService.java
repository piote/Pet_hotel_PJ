package com.myboot.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public List listMyReserve(String user_id) throws Exception;
	public Map listMyDetailReserve(Map paraMap, String startDate, String endDate) throws Exception;
	public List listMyReview(String user_id) throws Exception;
	public void cancelReserve(String res_num) throws Exception;
	
	
}
