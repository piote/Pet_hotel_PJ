package com.myboot.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.review.vo.ReviewVO;



public interface ReviewDAO {

	public List<ReviewVO> selectAllReviewList(Map pagingMap)throws DataAccessException;
	public List<ReviewVO> selectAllReviewList2(Map pagingMap)throws DataAccessException;
	public List<ReviewVO> selectAllReviewList3(Map pagingMap)throws DataAccessException;
	
	public int selectTotReview();
	
	public int selectNewReviewNO() throws DataAccessException;
	public void insertNewReview(Map reviewMap) throws DataAccessException;
	public void insertNewImage(Map reviewMap) throws DataAccessException;

	public List selectImageFileList(int reviewNO) throws DataAccessException;

	public void deleteReview(int reviewNO)throws DataAccessException;
	
	public List selectMainReview() throws DataAccessException;
	public List<ReviewVO> selectAllMyReservesList(Map pagingMap)throws DataAccessException;
	public int selectTotReserves();
	public List selectAllResList(String userId) throws DataAccessException;
	
	public void updateReview(Map reviewMap) throws DataAccessException;
	public List<ReviewVO> selectAllMyReviewList(Map pagingMap);
	
	public ReviewVO selectReview(int reviewNO) throws DataAccessException;


}
