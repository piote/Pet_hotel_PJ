package com.myboot.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	public List selectAllReviewList() throws DataAccessException;
	
	
	public int selectTotReview() throws DataAccessException;
	
}