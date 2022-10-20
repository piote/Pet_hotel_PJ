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

	//테스트용, 예약된 것들을 조회
	@Override
	public List listReservation() throws Exception {
		List ResList = null;
		ResList = reservationDAO.selectReservationList();
		return ResList;
	}
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
	
	
//	@Override
//	public int modMember(MemberVO member) throws Exception {
//		return memberDAO.updateMember(member);
//	}
//	
//	@Override
//	public MemberVO findMember(String id) throws DataAccessException {
//	    return memberDAO.selectMemberById(id);
//	}
//
//
//	@Override
//	public int removeMember(String id) throws Exception {
//		return memberDAO.deleteMember(id);
//	}
//	
//	public MemberVO login(MemberVO memberVO) throws Exception{
//		return memberDAO.loginById(memberVO);
//	}
}
