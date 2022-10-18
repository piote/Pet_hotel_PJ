package com.myboot.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("reservationDAO")
public interface ReservationDAO {
	 public List selectReservationList() throws DataAccessException;
	 
	 // 예약, 펫 서비스 등록
	 public int insertReservation(Map petserviceMap) throws DataAccessException;
	 public int insertPetserviceMap(Map petserviceMap) throws DataAccessException;
//	 
//	 public int updateMember(MemberVO memberVO) throws DataAccessException ;
//	 
//	 public MemberVO selectMemberById(String id);
//	 	 
//	 public int deleteMember(String id) throws DataAccessException;
//	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
//	 
//	

}
