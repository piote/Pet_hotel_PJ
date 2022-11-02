package com.myboot.introduce.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myboot.introduce.vo.IntroduceVO;

public interface IntroduceService {
	public IntroduceVO listintroduce() throws Exception;
	public int modIntroduce(Map introduceMap) throws DataAccessException;
}