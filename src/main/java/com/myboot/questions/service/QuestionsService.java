package com.myboot.questions.service;

import java.util.List;

import com.myboot.questions.vo.QuestionsVO;

public interface QuestionsService {
	public List<QuestionsVO> listQuestions() throws Exception;
}
