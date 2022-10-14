package com.myboot.questions.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.questions.dao.QuestionsDAO;
import com.myboot.questions.vo.QuestionsVO;

@Service("questionsService")
@Transactional(propagation = Propagation.REQUIRED)
public class QuestionsServiceImpl implements QuestionsService {
	@Autowired
	QuestionsDAO questionsDAO;
	
	@Override
	public List<QuestionsVO> listQuestions() throws Exception{
		List<QuestionsVO> articlesList =  questionsDAO.selectAllQuestionsList();
        return articlesList;
	}
}
