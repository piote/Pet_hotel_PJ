package com.myboot.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;


@Mapper
@Repository("reservationDAO")
public interface ReservationDAO {
	 public List selectReservationList() throws DataAccessException;
	 
	 // 예약, 펫 서비스 등록
	 public int insertReservation(ReservationVO petserviceMap) throws DataAccessException;
	 public int insertPetserviceList(List<PetserviceVO> petserviceList) throws DataAccessException;
	 // 사용가능한 예약 번호 
	 public int useReservationNum() throws DataAccessException;
	 
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
