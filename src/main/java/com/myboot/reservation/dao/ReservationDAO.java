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
	 // 예약, 펫 서비스 등록
	 public int insertReservation(ReservationVO ReservationVO) throws DataAccessException;
	 
	 public int insertPetserviceList(List<PetserviceVO> petserviceList) throws DataAccessException;
	 
	 // 사용가능한 예약 번호 
	 public int useReservationNum() throws DataAccessException;

	 //예약번호 검색
	 public ReservationVO SearchReservationNum(String reserNum) throws DataAccessException;

	 //예약번호로 펫 테이블 검색
	 public List<PetserviceVO> SearchPetServiceByResNum(String reserNum) throws DataAccessException;
	 
	 // 이용 횟수 불려오기
	 public int membershipCount(String id) throws DataAccessException;
	
	 public int deletePetserviceList(String res_Num) throws DataAccessException;
	
	 public int updateReservation(ReservationVO resVO) throws DataAccessException;

}
