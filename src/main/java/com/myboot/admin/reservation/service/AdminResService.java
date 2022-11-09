package com.myboot.admin.reservation.service;

import java.util.List;
import java.util.Map;

import com.myboot.admin.reservation.vo.AdminResFullVO;

public interface AdminResService {
	
	public List adminAllResList() throws Exception;
	
	public List searchResList(Map searchOption) throws Exception;
	
	public List adminPetList(String reserNum) throws Exception;
	
	public List adminSelectPet(String reserNum) throws Exception;
	
	public void updateResList(Map reservationMap) throws Exception;
	
	public void updatePetList(Map petserviceMap) throws Exception;
	
	public void insertPetList(Map petserviceMap) throws Exception;
	
	public void deletePetList(String petNum) throws Exception;
	
	public int adminTotalResNum() throws Exception;
	
	public void updateResStateC(String reserNum) throws Exception;
	
	public void updateResStateY(String reserNum) throws Exception;
	
	
	public AdminResFullVO SearchReservationNum(String reserNum);
	public List<AdminResFullVO> SearchPetServiceByResNum(String reserNum);

	public int adminTotalYResCount(String userID) throws Exception;

	public void userMembershipUpdate(String string) throws Exception;

}
