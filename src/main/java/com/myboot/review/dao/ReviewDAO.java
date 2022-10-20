package com.myboot.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myboot.review.vo.ReviewVO;



public interface ReviewDAO {

	public List<ReviewVO> selectAllReviewList(Map pagingMap)throws DataAccessException;

	public int selectTotReview();
	
	
	public int insertNewReview(Map reviewMap) throws DataAccessException;
	public void insertNewImage(Map reviewMap) throws DataAccessException;

	List selectImageFileList(int reviewNO) throws DataAccessException;
	
}