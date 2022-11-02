package com.myboot.introduce.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.introduce.vo.IntroduceVO;

@Mapper
@Repository("introduceDAO")
public interface IntroduceDAO {
	
	public IntroduceVO selectAllintroduceList() throws DataAccessException;
	public void insertIntroduce(Map introduceMap) throws DataAccessException;
	public int selectNewINTRO_NUM() throws DataAccessException;
	
}