package com.myboot.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.review.dao.ReviewDAO;
import com.myboot.review.vo.ImageVO;
import com.myboot.review.vo.ReviewVO;


@Service("reviewService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl  implements ReviewService{
	
	@Autowired
	ReviewDAO reviewDAO;
	
	/*
	 * @Override public List<ReviewVO> reviewDetail_1() throws Exception{
	 * List<ReviewVO> reviewList = reviewDAO.selectAllReviewList(); return
	 * reviewList; }
	 */
	
	@Override
	public Map reviewDetail_1(Map pagingMap) throws Exception{
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO. selectAllReviewList(pagingMap);
		int totReview = reviewDAO.selectTotReview();
		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	//	articlesMap.put("totArticles", 170);
		return reviewMap;
	}
	

//다중 이미지 추가하기	
	@Override
	public int addNewReview(Map reviewMap) throws Exception{
		int reviewNO = reviewDAO.insertNewReview(reviewMap);
		reviewMap.put("reviewNO", reviewNO);
		List<ImageVO> imageFileList = (ArrayList)reviewMap.get("imageFileList");
		
		if(imageFileList != null && imageFileList.size() != 0) {
		reviewDAO.insertNewImage(reviewMap);
		}
		return reviewNO;
	}
	
	
	
}
