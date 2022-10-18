package com.myboot.reservation.service;

import java.util.List;
import java.util.Map;

import com.myboot.reservation.vo.ReservationVO;

public interface ReservationService {
	
	 public List listReservation() throws Exception;
	 public int addReservation(ReservationVO reservationVO) throws Exception;
	 public int addPetService(Map petServiceMap) throws Exception;
//	 
//	 public int modMember(MemberVO memberVO) throws Exception;
//	 
//	 public MemberVO findMember(String id) throws DataAccessException;
//	 
//	 public int removeMember(String id) throws Exception;
//	 public MemberVO login(MemberVO memberVO) throws Exception;
}
