package com.myboot.questions.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.questions.vo.QuestionsVO;

@Mapper
@Repository("questionsDAO")
public interface QuestionsDAO {
	public List selectAllQuestionsList() throws DataAccessException;
}
