package com.myboot.questions.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.questions.vo.QuestionsVO;

@Mapper
@Repository("questionsDAO")
public interface QuestionsDAO {
	public List selectAllQuestionsList() throws DataAccessException;
	
	public List selectAllQuestionsList_page(Map<String, Integer> pagingMap) throws DataAccessException;
	public int selectTotQuestions() throws DataAccessException;
	public List searchQuestionsList(Map pagingMap) throws DataAccessException;
	public int searchTotQuestions(String keyword) throws DataAccessException;
	
	
}
