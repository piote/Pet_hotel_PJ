package com.myboot.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.review.vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {

	public List<ReviewVO> selectAllReviewList(Map pagingMap);

	public int selectTotReview();
	
}