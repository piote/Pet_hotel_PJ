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
	 public List selectAllMyReservesList(Map paraMap) throws DataAccessException;
	 public List selectMyDetailReservesList(Map paraMap) throws DataAccessException;
	 
	 public int selectTotReserves() throws DataAccessException;
	 public int searchTotReserves(String searchWord) throws DataAccessException;

	 public List selectMyReviewList(String user_id) throws DataAccessException;
	 public void updateMyReserveCancel(String res_num) throws DataAccessException;
	 
}
