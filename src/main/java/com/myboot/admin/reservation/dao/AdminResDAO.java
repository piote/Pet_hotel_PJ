package com.myboot.admin.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("adminresDAO")
public interface AdminResDAO {
	
	 //관리자 예약관리 예약조회
	 public List adminResList() throws DataAccessException;
	 
	 //관리자 예약관리 예약검색
	 public List searchadminResList(Map searchOption) throws DataAccessException;
	
	 //관리자 예약관리 예약불러오기
	 public List adminPetList() throws DataAccessException;
	
	 
	 
	 //관리자 예약관리 예약변경(예약 수정)
	 public void updateAdminReservation(Map reservationMap) throws DataAccessException;
	 
	 //관리자 예약관리 예약변경(펫 수정)
	 public void updateAdminPetservice(Map petserviceMap) throws DataAccessException;
	 
	 //관리자 예약관리 예약변경(펫 삭제)
	 public void deleteAdminPetList(String petNum) throws DataAccessException;
	 
	 //관리자 예약관리 예약변경(예약상태 수정)
	 public void updateAdminResState(String reserNum) throws DataAccessException;

	 
}
