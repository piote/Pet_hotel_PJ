package com.myboot.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Action;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;

import com.myboot.review.vo.ReviewVO;
import com.myboot.user.vo.UserVO;

@Controller
public  interface ReviewService {
	
	//리뷰게시판 조회
	public Map reviewDetail_1(Map pagingMap) throws Exception;
	public Map reviewDetail_2(Map pagingMap) throws Exception;
	public Map reviewDetail_3(Map pagingMap) throws Exception;
	//public Map checkReview(Map pagingMap) throws Exception;
	
	//마이페이지 내 리뷰 조회
	public Map listMyDetailReview(Map pagingMap) throws Exception;
	public Map listMyDetailReview2(Map pagingMap) throws Exception;
	
	//CRUD
	public Map viewReview(int reviewNO) throws Exception;
	public int addNewReview(Map reviewMap, String fileName)throws Exception;
	public void removeReview(int reviewNO)throws Exception;
	public void modReview(Map reviewMap) throws Exception;

	//예약 확인
	public Map listMyDetailReserve(Map pagingMap) throws Exception;
	public List listMyReserve(String user_id) throws Exception;
	public List listRes(String userId) throws Exception;

	//좋아요 기능
	public int selectReviewLike(int reviewNO)throws Exception;
	public List<ReviewVO> selectReviewLikeCheck(Map reviewNO)throws Exception;
	public void insert_like(HashMap<String, Object> hashMap) throws Exception;
	public void delete_like(HashMap<String, Object> hashMap)throws Exception;
	public void delete_like_by_reviewNO(int hashMap)throws Exception;
	
	
	//	메인페이지 리뷰조회
	public List returnReviewFormain() throws Exception ;

}

	

