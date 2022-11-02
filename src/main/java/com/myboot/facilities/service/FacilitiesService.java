package com.myboot.facilities.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myboot.facilities.vo.FacilitiesVO;

public interface FacilitiesService {
	public FacilitiesVO listfacilities() throws Exception;
	public int modFacilities(Map facilitiesMap) throws DataAccessException;

}