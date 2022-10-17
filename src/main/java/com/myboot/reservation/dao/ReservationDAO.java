package com.myboot.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("reservationDAO")
public interface ReservationDAO {
	 public List selectAllMemberList() throws DataAccessException;
//	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
//	 
//	 public int updateMember(MemberVO memberVO) throws DataAccessException ;
//	 
//	 public MemberVO selectMemberById(String id);
//	 	 
//	 public int deleteMember(String id) throws DataAccessException;
//	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
//	 
//	

}
