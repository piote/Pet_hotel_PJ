package com.myboot.questions.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public Map listQuestions_page(Map pagingMap,String keyword) throws Exception {
		Map articlesMap = new HashMap();
		List<QuestionsVO> questionsList = null;
		int totArticles=0;
		if(keyword==null) {
			questionsList = questionsDAO.selectAllQuestionsList_page(pagingMap);
			totArticles = questionsDAO.selectTotQuestions();
		}else {
			pagingMap.put("keyword", keyword);
			questionsList = questionsDAO.searchQuestionsList(pagingMap);
			articlesMap.put("keyword", keyword);
			totArticles = questionsDAO.searchTotQuestions(keyword);
		}
		articlesMap.put("questionsList", questionsList);
		articlesMap.put("totArticles", totArticles);
		return articlesMap;				
	}
	
//	게시글 조회
	@Override
	public QuestionsVO questionsViewArticle(int q_num) throws Exception {
		QuestionsVO questionsVO = questionsDAO.selectQuestions(q_num);
		System.out.println(questionsVO);
		return questionsVO;
	}
	
	
//  게시글 추가
	@Override
	public int addNewQuestions(Map questionsMap) throws Exception{
		int q_Num = questionsDAO.selectNewQ_NUM();
		questionsMap.put("q_Num", q_Num);
		questionsDAO.insertNewQuestions(questionsMap);
		return q_Num;
	}
	
	
//	@Override
//	public void modArticle(Map articleMap) throws Exception {
//		questionsDAO.updateArticle(articleMap);
//	}
	
	@Override
	public void removeQuestionsArticle(int q_num) throws Exception {
		questionsDAO.deleteQuestionsArticle(q_num);
	}
}
