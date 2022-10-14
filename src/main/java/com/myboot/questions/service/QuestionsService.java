package com.myboot.questions.service;

import java.util.List;
import java.util.Map;

import com.myboot.questions.vo.QuestionsVO;

public interface QuestionsService {
	public List<QuestionsVO> listQuestions() throws Exception;
	public Map listQuestions_page(Map<String, Integer> pagingMap) throws Exception;
}
