package com.myboot.reservation.vo;

import org.springframework.stereotype.Component;

import com.myboot.mypage.vo.MyPageVO;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Component("reservationVO")
public class ReservationVO {
	private int res_num;
	private Date res_st;
	private Date res_end;
	private String id;
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
	
}
