package com.myboot.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import com.myboot.review.vo.ReviewVO;

@Controller
public  interface ReviewService {

	public Map reviewDetail_1(Map pagingMap) throws Exception;

	public int addNewReview(Map reviewMap) throws Exception;

	

	}

	

