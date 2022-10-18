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
		int reviewNO = (Integer)reviewMap.get("reviewNO");
		int imageFileNO = selectNewImageFileNO();
		
		if(imageFileList != null && imageFileList.size() != 0) {
			for(ImageVO imageVO : imageFileList){
				imageVO.setImageFileNO(++imageFileNO);
				imageVO.setReviewNO(reviewNO);
			 }
			sqlSession.insert("mapper.review.insertNewImage",imageFileList);
		} 
		
	}

	public List selectImageFileList(int reviewNO) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.review.selectImageFileList",reviewNO);
		return imageFileList;
	}
	
	
	private int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.review.selectNewImageFileNO");
		
	}
	
	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int reviewNO = selectNewReviewNO();
		reviewMap.put("reviewNO", reviewNO);
		sqlSession.insert("mapper.review.insertNewReview",reviewMap);
		return reviewNO;
	}

	private int selectNewReviewNO() {
		return sqlSession.selectOne("mapper.review.selectNewReviewNO");
	}

	@Override
	public List<ReviewVO> selectAllReviewList(Map pagingMap) {
		
		return null;
	}

	@Override
	public int selectTotReview() {

		return 0;
	}
	

}