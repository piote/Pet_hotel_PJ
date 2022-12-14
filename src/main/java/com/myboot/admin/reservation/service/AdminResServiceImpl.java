package com.myboot.admin.reservation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.admin.reservation.dao.AdminResDAO;
import com.myboot.admin.reservation.vo.AdminResFullVO;


@Service("adminresService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminResServiceImpl implements AdminResService{
	@Autowired
	private AdminResDAO adminresDAO;

	@Override
	public List adminAllResList() throws Exception{
		List AdminAllResList = null;
		AdminAllResList = adminresDAO.adminResList();
		return AdminAllResList;
	}
	
	@Override
	public List searchResList(Map searchOption) throws Exception{
		List AdminAllResList = null;
		AdminAllResList = adminresDAO.searchadminResList(searchOption);
		return AdminAllResList;
	}
	
	@Override
	public List adminPetList(String reserNum) throws Exception{
		List AdminPetList = null;
		AdminPetList = adminresDAO.adminSelectRes(reserNum);
		return AdminPetList;
	}
	
	@Override
	public List adminSelectPet(String reserNum) throws Exception{
		List adminSelectPet = null;
		adminSelectPet = adminresDAO.adminSelectPet(reserNum);
		return adminSelectPet;
	}
	
	@Override
	public void updateResList(Map reservationMap) throws Exception{
		adminresDAO.adminUpdateRes(reservationMap);
	}
	
	@Override
	public void updatePetList(Map petserviceMap) throws Exception{
		adminresDAO.adminUpdatePet(petserviceMap);
	}
	
	@Override
	public void insertPetList(Map petserviceMap) throws Exception{
		adminresDAO.adminInsertPet(petserviceMap);
	}
	
	@Override
	public void deletePetList(String petNum) throws Exception{
		adminresDAO.adminDeletePet(petNum);
	}
	
	//예약 횟수
	@Override
	public int adminTotalResNum() throws Exception{
		int adminTotalResNum = 0;
		adminTotalResNum = adminresDAO.adminTotalResNum(adminTotalResNum);
		return adminTotalResNum;
	}
	
	@Override
	public void updateResStateC(String reserNum) throws Exception{
		adminresDAO.adminUpdateSTC(reserNum);
	}
	
	@Override
	public void updateResStateY(String reserNum) throws Exception{
		adminresDAO.adminUpdateSTY(reserNum);
	}

	@Override
	public AdminResFullVO SearchReservationNum(String reserNum) {
		return adminresDAO.SearchReservationNum(reserNum);
	}
	
	@Override
	public List<AdminResFullVO> SearchPetServiceByResNum(String reserNum) {
		return adminresDAO.SearchPetServiceByResNum(reserNum);
	}
	
	//예약완료 횟수
	@Override
	public int adminTotalYResCount(String userID) throws Exception{
		int userYResTotalNum = 0;
		userYResTotalNum = adminresDAO.adminTotalYResCount(userID);
		return userYResTotalNum;
	}
	
	//맴버십 변경
	@Override
	public void userMembershipUpdate(String userId) throws Exception {
		System.out.println(userId);
		
		adminresDAO.userMembershipUpdate(userId);	
		System.out.println("end");
	}

}
