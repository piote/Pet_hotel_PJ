package com.myboot.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.review.dao.ReviewDAO;
import com.myboot.review.vo.ReviewVO;

@Service("reviewService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl  implements ReviewService{
	
	@Autowired
	ReviewDAO reviewDAO;
	
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
	

	

}
