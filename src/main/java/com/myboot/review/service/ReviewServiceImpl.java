package com.myboot.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.mypage.dao.MyPageDAO;
import com.myboot.review.dao.ReviewDAO;
import com.myboot.review.vo.ImageVO;
import com.myboot.review.vo.ReviewVO;

@Service("reviewService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	MyPageDAO myPageDAO;
	
	//리뷰게시판 조회
	@Override
	public Map reviewDetail_1(Map pagingMap) throws Exception {
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList(pagingMap);
		
		int totReview = reviewDAO.selectTotReview();

		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	
		return reviewMap;
	}
	
	@Override
	public Map reviewDetail_2(Map pagingMap) throws Exception {
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList2(pagingMap);
		
		int totReview = reviewDAO.selectTotReview();

		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	
		return reviewMap;
	}
	
	@Override
	public Map reviewDetail_3(Map pagingMap) throws Exception {
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList3(pagingMap);
		
		int totReview = reviewDAO.selectTotReview();

		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	
		return reviewMap;
	}
	
	@Override
	public Map checkReview(Map pagingMap) throws Exception {
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList(pagingMap);
		
		int totReview = reviewDAO.selectTotReview();

		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	
		return reviewMap;
	}
	//리뷰게시판 끝
	
	
	//마이페이지 내 리뷰 조회
	@Override
	public Map listMyDetailReview(Map pagingMap) throws Exception {
		Map myReviewMap = new HashMap();
		List<ReviewVO> myReviewList = reviewDAO.selectAllMyReviewList(pagingMap);
		int totReview = reviewDAO.selectTotReview();

		myReviewMap.put("myReviewList", myReviewList);
		myReviewMap.put("totReview", totReview);
		
		return myReviewMap;
	}
	
	@Override
	public Map listMyDetailReview2(Map pagingMap) throws Exception {
		Map myReviewMap = new HashMap();
		List<ReviewVO> myReviewList = reviewDAO.selectAllMyReviewList2(pagingMap);
		int totReview = reviewDAO.selectTotReview();

		myReviewMap.put("myReviewList", myReviewList);
		myReviewMap.put("totReview", totReview);

		return myReviewMap;
	}
	
	//CRUD
	@Override
	public Map viewReview(int reviewNO) throws Exception {
		Map reviewMap = new HashMap();
		ReviewVO reviewVO = reviewDAO.selectReview(reviewNO);
		
		reviewMap.put("review", reviewVO);

		return reviewMap;
	}
	
	@Override
	public int addNewReview(Map reviewMap, String fileName) throws Exception {
		int reviewNO = reviewDAO.selectNewReviewNO();
		
		reviewMap.put("reviewNO", reviewNO);
		
		if (fileName != null) {
			String fileUrl = "resources/review/review_image" + "/" + reviewNO + "/" + fileName;
			reviewMap.put("review_image_url", fileUrl);
			reviewDAO.insertNewReview(reviewMap);
			reviewMap.put("reviewNO", reviewNO);
		} else {
			reviewDAO.insertNewReview(reviewMap);
		}

		return reviewNO;
	}
	
	@Override
	public void modReview(Map reviewMap) throws Exception {
		reviewDAO.updateReview(reviewMap);
	}

	@Override
	public void removeReview(int reviewNO) throws Exception {
		reviewDAO.deleteReview(reviewNO);
	}
	//CRUD 끝 
	
	
	//예약 확인 
	@Override
	public List listMyReserve(String user_id) throws Exception{
		return myPageDAO.selectMyReservesList(user_id);
	}
	@Override
	public List listRes(String userId) throws Exception {
		List resList = null;
		resList = reviewDAO.selectAllResList(userId);
		return resList;
	}
	@Override
	public Map listMyDetailReserve(Map pagingMap) throws Exception {
		Map myReserveMap = new HashMap();
		List<ReviewVO> myReserveList = reviewDAO.selectAllMyReservesList(pagingMap);
		
		int totReserves = reviewDAO.selectTotReserves();

		myReserveMap.put("myReserveList", myReserveList);
		myReserveMap.put("totReserves", totReserves);
		// articlesMap.put("totArticles", 170);
		return myReserveMap;
	}		
		
	//좋아요 기능 
	
	@Override
	public int selectReviewLike(int reviewNO)throws Exception {
		int like_cnt = reviewDAO.selectReviewLike(reviewNO);
		return like_cnt;
	}
	
	@Override
	public List<ReviewVO> selectReviewLikeCheck(Map reviewNO)throws Exception {
		 List<ReviewVO> like_check = reviewDAO.selectReviewLikeCheck(reviewNO);
		return like_check;
	}
	@Override
	public void insert_like(HashMap<String, Object> hashMap) throws Exception {
		reviewDAO.insert_like(hashMap);
	}
	
	@Override
	public void delete_like(HashMap<String, Object> hashMap) throws Exception {
		reviewDAO.delete_like(hashMap);
	}
	
	public void delete_like_by_reviewNO(int hashMap)throws Exception {
		reviewDAO.delete_like_by_reviewNO(hashMap);
	}
	
	//	메인페이지 리뷰조회
	@Override
	public List returnReviewFormain() throws Exception {
		List reviewList = reviewDAO.selectMainReview();
		return reviewList;
	}

}
