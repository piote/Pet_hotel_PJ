package com.myboot.membership.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboot.reservation.dao.ReservationDAO;
import com.myboot.user.vo.UserVO;

@Service("memberShipService")
public class MemberShipServiceImpl implements MemberShipService {
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public int membershipCount(String id) throws Exception{
		return reservationDAO.membershipCount(id);
	}
}
