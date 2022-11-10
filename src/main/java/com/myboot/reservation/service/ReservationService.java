package com.myboot.reservation.service;

import java.util.List;
import java.util.Map;

import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;

public interface ReservationService {
	 
	 public int addReservation(ReservationVO reservationVO) throws Exception;
	 
	 public int addPetService(List<PetserviceVO> petServiceList) throws Exception;
	 
	 public int useReservationNum() throws Exception;
	 
	 public ReservationVO SearchReservationNum(String reserNum) throws Exception;
	 
	 public List<PetserviceVO> SearchPetServiceByResNum(String reserNum) throws Exception;

	 public int deletePetserviceList(String reserNum)throws Exception;
	 
	 public int updateReservation(ReservationVO resVO)throws Exception;
	 
	 
}
