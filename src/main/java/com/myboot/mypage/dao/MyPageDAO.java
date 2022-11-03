package com.myboot.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.reservation.vo.ReservationVO;
import com.myboot.review.vo.ReviewVO;

@Mapper
@Repository("myPageDAO")
public interface MyPageDAO {
	 public List<ReservationVO> selectMyReservesList(String user_id) throws DataAccessException;
	 public List<ReservationVO> selectAllMyReservesList(Map paraMap) throws DataAccessException;
	 public List<ReservationVO> selectMyDetailReservesList(Map paraMap) throws DataAccessException;
	 
	 public int selectTotReserves(Map paraMap) throws DataAccessException;
	 public int searchTotReserves(Map paraMap) throws DataAccessException;

	 public List<ReviewVO> selectMyReviewList(String user_id) throws DataAccessException;
	 public void updateMyReserveCancel(String res_num) throws DataAccessException;
	 
}
