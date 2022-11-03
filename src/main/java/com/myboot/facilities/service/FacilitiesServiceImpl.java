package com.myboot.facilities.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.facilities.dao.FacilitiesDAO;
import com.myboot.facilities.vo.FacilitiesVO;

@Service("facilitiesService")
@Transactional(propagation = Propagation.REQUIRED)
public class FacilitiesServiceImpl implements FacilitiesService {
	@Autowired
	FacilitiesDAO facilitiesDAO;
	
	@Override
	public FacilitiesVO listfacilities() throws Exception {
		FacilitiesVO facilitiesList =  facilitiesDAO.selectAllfacilitiesList();
        return facilitiesList;
	}
	
	public int modFacilities(Map facilitiesMap) throws DataAccessException {
		int f_Num = facilitiesDAO.selectNewFAC_NUM();
		// 가장 높은 숫자+1을 i_Num에 저장
		facilitiesMap.put("fac_num", f_Num);
//							 └ vo와 이름이 같아야함		
		facilitiesDAO.insertFacilities(facilitiesMap);
		return f_Num;
		
	}
	
	
}