package com.myboot.review.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.review.vo.ImageVO;
import com.myboot.review.vo.ReviewVO;




@Repository("reviewDAO")

public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	//리뷰 조회
	@Override public List<ReviewVO> selectAllReviewList(Map pagingMap) {
			List<ReviewVO> reviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllReviewList", pagingMap);
			return reviewList;
	}
	@Override public List<ReviewVO> selectAllReviewList2(Map pagingMap) {
			List<ReviewVO> reviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllReviewList2", pagingMap);
			return reviewList;
	}
	@Override public List<ReviewVO> selectAllReviewList3(Map pagingMap) {
			List<ReviewVO> reviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllReviewList3", pagingMap);
			return reviewList;
	}
	//메인페이지에서 리뷰조회
	@Override
	public List selectMainReview() throws DataAccessException{
		return sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectMainReview");
	}
	
	//내 리뷰 조회	
	public List selectAllMyReviewList(Map pagingMap){
		List<ReviewVO> myReviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllMyReviewList", pagingMap);
		return myReviewList;																	
	}
	public List selectAllMyReviewList2(Map pagingMap){
		List<ReviewVO> myReviewList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllMyReviewList2", pagingMap);
		return myReviewList;																	
	}
	
	//페이징 	
	@Override
	public int selectTotReview(String grade) throws DataAccessException {
		int totReview = sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectTotReview", grade);
		return totReview;
	}
	
	@Override
	public int selectTotReserves() throws DataAccessException {
		int totReserves = sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectTotReserves");
		return totReserves;
	}
	
	@Override
	public int selectTotReview_user(String user_id) throws DataAccessException {
		int totReview = sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectTotReview_user", user_id);
		return totReview;
	}
	
	
	
	//CRUD
	@Override
	public int selectNewReviewNO() {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectNewReviewNO");
	}		
	@Override
	public void insertNewReview(Map reviewMap) throws DataAccessException {
		sqlSession.insert("com.myboot.review.dao.ReviewDAO.insertNewReview",reviewMap);
	}
	@Override
	public void insertNewImage(Map reviewMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)reviewMap.get("imageFileList");
			
		if(imageFileList != null && imageFileList.size() != 0) {
			int reviewNO = (Integer)reviewMap.get("reviewNO");
			int imageFileNO = selectNewImageFileNO();
			
			for(ImageVO imageVO : imageFileList){
				imageVO.setImageFileNO(++imageFileNO);
				imageVO.setReviewNO(reviewNO);
			 }
			sqlSession.insert("com.myboot.review.dao.ReviewDAO.insertNewImage",imageFileList);
		} 
	}
	public List selectImageFileList(int reviewNO) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectImageFileList",reviewNO);
		return imageFileList;
	}
	private int selectNewImageFileNO() {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectNewImageFileNO");
		
	}
	@Override
	public ReviewVO selectReview(int reviewNO) throws DataAccessException {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectReview", reviewNO);
	}
	@Override
	public void deleteReview(int reviewNO) throws DataAccessException {
		sqlSession.delete("com.myboot.review.dao.ReviewDAO.deleteReview", reviewNO);	
	}
	@Override
	public void  updateReview(Map reviewMap) throws DataAccessException {
	    System.out.println(reviewMap.get("imageFileName"));
		sqlSession.update("com.myboot.review.dao.ReviewDAO.updateReview", reviewMap);
	}
	
	//예약조회
	@Override
	public List selectAllMyReservesList(Map pagingMap){
		List<ReviewVO> myReserveList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllMyReservesList", pagingMap);
		return myReserveList;
	}	
	@Override 
	public List selectAllResList(String userId) {
		List resList = sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectAllResList", userId);
		return resList;
	}
	//좋아요 기능
	@Override
	public List<ReviewVO> selectReviewLikeCheck(Map reviewNO) throws DataAccessException{
		return sqlSession.selectList("com.myboot.review.dao.ReviewDAO.selectReviewLikeCheck", reviewNO);
	}
	@Override
	public int selectReviewLike(int reviewNO) throws DataAccessException {
		return sqlSession.selectOne("com.myboot.review.dao.ReviewDAO.selectReviewLike", reviewNO);
	}
	@Override
	public void insert_like(HashMap<String, Object> hashMap)throws DataAccessException{
		sqlSession.insert("com.myboot.review.dao.ReviewDAO.insert_like",hashMap);
	}
	@Override
	public void delete_like(HashMap<String, Object> hashMap)throws DataAccessException{
		sqlSession.insert("com.myboot.review.dao.ReviewDAO.delete_like",hashMap);
	}
	@Override
	public void delete_like_by_reviewNO(int hashMap)throws DataAccessException{
		sqlSession.insert("com.myboot.review.dao.ReviewDAO.delete_like_by_reviewNO",hashMap);
	}
	

	  
	 

	  
	  
	  
	 
	  
	
	  
	


}