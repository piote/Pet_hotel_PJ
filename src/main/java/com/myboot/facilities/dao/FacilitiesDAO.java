package com.myboot.facilities.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myboot.facilities.vo.FacilitiesVO;

@Mapper
@Repository("facilitiesDAO")
public interface FacilitiesDAO {
	
	public FacilitiesVO selectAllfacilitiesList() throws DataAccessException;
	public void insertFacilities(Map facilitiesMap) throws DataAccessException;
	public int selectNewFAC_NUM() throws DataAccessException;
	
}