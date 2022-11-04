package com.myboot.admin.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.admin.reservation.dao.AdminResDAO;


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
	public void deletePetList(String petNum) throws Exception{
		adminresDAO.adminDeletePet(petNum);
	}
	
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

	
}
