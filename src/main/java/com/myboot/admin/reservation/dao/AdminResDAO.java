package com.myboot.admin.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.admin.reservation.vo.AdminResFullVO;


@Mapper
@Repository("adminresDAO")
public interface AdminResDAO {
	
	 //관리자 예약관리 보이는 예약조회
	 public List adminResList() throws DataAccessException;
	 
	 //관리자 예약관리 예약검색
	 public List searchadminResList(Map searchOption) throws DataAccessException;
	
	 //관리자 예약수정 예약불러오기
	 public List adminSelectRes(String reserNum) throws DataAccessException;
	 public AdminResFullVO SearchReservationNum(String reserNum) throws DataAccessException;
	 public List<AdminResFullVO> SearchPetServiceByResNum(String reserNum) throws DataAccessException;
	
	 //관리자 예약수정 펫 테이블 추가
	 public List adminSelectPet(String reserNum) throws DataAccessException;
	 
	 //관리자 예약수정 예약불러오기(변경)
	 public void adminUpdateRes(Map reservationMap) throws DataAccessException;
	 
	 //관리자 예약수정 펫테이블 추가(변경)
	 public void adminUpdatePet(Map petserviceMap) throws DataAccessException;
	 
	 //관리자 예약수정 예약변경(펫 추가)
	 public void adminInsertPet(Map petserviceMap) throws DataAccessException;
	 
	 //관리자 예약관리 예약변경(펫 삭제)
	 public void adminDeletePet(String petNum) throws DataAccessException;
	 
	 //관리자 예약관리 예약갯수
	 public int adminTotalResNum(int reserNum) throws DataAccessException;
	 
	 //관리자 예약취소 상태변경
	 public void adminUpdateSTC(String reserNum) throws DataAccessException;
	 
	 //관리자 예약확인 멤버쉽카운팅
	 public void adminUpdateSTY(String reserNum) throws DataAccessException;

	
}
