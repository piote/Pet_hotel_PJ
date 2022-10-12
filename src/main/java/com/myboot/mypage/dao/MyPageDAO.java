package com.myboot.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("myPageDAO")
public interface MyPageDAO {
	 public List selectMyReservesList(String user_id) throws DataAccessException;
//	 public Map selectMyReservesList(Map paraMap) throws DataAccessException;

//	 public List<ReserveVO> selectMyReviewList(String user_id) throws DataAccessException;
		public void updateMyReserveCancel(String order_id) throws DataAccessException;
}
