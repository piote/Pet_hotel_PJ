package com.myboot.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.reservation.dao.ReservationDAO;
import com.myboot.reservation.vo.PetserviceVO;
import com.myboot.reservation.vo.ReservationVO;


@Service("reservationService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public int addReservation(ReservationVO reservationVO) throws Exception {
		return reservationDAO.insertReservation(reservationVO);
	}
	
	@Override
	public int addPetService(List<PetserviceVO> petServiceList) throws Exception {
		return reservationDAO.insertPetserviceList(petServiceList);
	}
	
	@Override
	public int useReservationNum() throws Exception {
		return reservationDAO.useReservationNum();
	}
	
	@Override
	public ReservationVO SearchReservationNum(String reserNum) {
	
		return reservationDAO.SearchReservationNum(reserNum);
	}
	
	@Override
	public List<PetserviceVO> SearchPetServiceByResNum(String reserNum) {
		return reservationDAO.SearchPetServiceByResNum(reserNum);
	}
	
	@Override
	public int updateReservation(ReservationVO resVO)throws Exception {
		
		return reservationDAO.updateReservation(resVO);
	}
	
	@Override
	public int deletePetserviceList(String reserNum)throws Exception {
		
		return reservationDAO.deletePetserviceList(reserNum);
	}
	
}
