package com.myboot.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.review.vo.ImageVO;
import com.myboot.review.vo.ReviewVO;




@Repository("reviewDAO")

public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	
	
	public void insertNewImage(Map reviewMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)reviewMap.get("imageFileList");
	
		
		if(imageFileList != null && imageFileList.size() != 0) {
			int reviewNO = (Integer)reviewMap.get("reviewNO");
			int imageFileNO = selectNewImageFileNO();
			
			for(ImageVO imageVO : imageFileList){
				imageVO.setImageFileNO(++imageFileNO);
				imageVO.setReviewNO(reviewNO);
			 }
			sqlSession.insert("com.myboot.review.dao.ReviewDAO.insertNewImage",imageFileList);
		} 
		
	}

	public List selectImageFileList(int reviewNO) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectImageFileList",reviewNO);
		return imageFileList;
	}
	
	
	private int selectNewImageFileNO() {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectNewImageFileNO");
		
	}
	
	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int reviewNO = selectNewReviewNO();
		reviewMap.put("reviewNO", reviewNO);
		sqlSession.insert("com.myboot.review.dao.ReviewDAO.insertNewReview",reviewMap);
		return reviewNO;
	}
				
	private int selectNewReviewNO() {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectNewReviewNO");
	}							 //("mapper.review.selectNewReviewNO");

	
	  @Override public List<ReviewVO> selectAllReviewList(Map pagingMap) {
			List<ReviewVO> reviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllReviewList", pagingMap);
			return reviewList;
	  }
	 
	
	  
	
	  
	@Override
	public int selectTotReview() {

		return 0;
	}
	

}