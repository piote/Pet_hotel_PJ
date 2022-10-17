package com.myboot.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.reservation.dao.ReservationDAO;


@Service("reservationService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;

//	@Override
//	public List listMembers() throws Exception {
//		List membersList = null;
//		membersList = reservationDAO.selectAllMemberList();
//		return membersList;
//	}
//
//	@Override
//	public int addMember(MemberVO member) throws Exception {
//		return memberDAO.insertMember(member);
//	}
//	
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
