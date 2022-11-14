package com.myboot.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.review.vo.ReviewVO;

public interface ReviewDAO {
	
	//리뷰 조회
	public List<ReviewVO> selectAllReviewList(Map pagingMap) throws DataAccessException;
	public List<ReviewVO> selectAllReviewList2(Map pagingMap) throws DataAccessException;
	public List<ReviewVO> selectAllReviewList3(Map pagingMap) throws DataAccessException;
	public List selectMainReview() throws DataAccessException;
	
	//내 리뷰 조회
	public List<ReviewVO> selectAllMyReviewList(Map pagingMap) throws DataAccessException;
	public List selectAllMyReviewList2(Map pagingMap) throws DataAccessException;
	
	//페이징
	public int selectTotReview() throws DataAccessException;
	public int selectTotReserves() throws DataAccessException;
	
	//CRUD
	public int selectNewReviewNO() throws DataAccessException;
	
	public void insertNewReview(Map reviewMap) throws DataAccessException;
	public void insertNewImage(Map reviewMap) throws DataAccessException;
	public List selectImageFileList(int reviewNO) throws DataAccessException;
	
	public ReviewVO selectReview(int reviewNO) throws DataAccessException;
	
	public void deleteReview(int reviewNO) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;

	//예약 조회
	public List<ReviewVO> selectAllMyReservesList(Map pagingMap) throws DataAccessException;
	public List selectAllResList(String userId) throws DataAccessException;
	
	//좋아요 기능 
	public List<ReviewVO> selectReviewLikeCheck(Map reviewNO) throws DataAccessException;
	public int selectReviewLike(int reviewNO) throws DataAccessException;
	public void insert_like(HashMap<String, Object> hashMap) throws DataAccessException;
	public void delete_like(HashMap<String, Object> hashMap) throws DataAccessException;
	
}
