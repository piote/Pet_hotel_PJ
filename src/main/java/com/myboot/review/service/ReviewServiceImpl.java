package com.myboot.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.review.dao.ReviewDAO;
import com.myboot.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl  implements ReviewService{
	@Autowired
	ReviewDAO reviewDAO;
	
	public Map listReview(Map pagingMap) throws Exception{
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = reviewDAO.selectAllReviewList(pagingMap);
		int totReview = reviewDAO.selectTotReview();
		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totReview", totReview);
	//	articlesMap.put("totArticles", 170);
		return reviewMap;
	}

	@Override
	public Map listReview_page(Map pagingMap) {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*
	 * @Override public List<ReviewVO> listReview() throws Exception{ List<ReviewVO>
	 * reviewList = reviewDAO.selectAllReviewList(); return reviewList; }
	 */
	
	/*
	 * @Override public Map listReview_page(Map pagingMap) { // TODO Auto-generated
	 * method stub return null; }
	 */
}
