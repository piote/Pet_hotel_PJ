package com.myboot.questions.service;

import java.util.List;
import java.util.Map;

import com.myboot.questions.vo.QuestionsVO;

public interface QuestionsService {
	public List<QuestionsVO> listQuestions() throws Exception;
	public Map listQuestions_page(Map pagingMap,String ketword) throws Exception;
	public QuestionsVO questionsViewArticle(int questionsVO) throws Exception;
	public int addNewQuestions(Map questionsMap) throws Exception;
	public void removeQuestionsArticle(int q_num) throws Exception;

}
