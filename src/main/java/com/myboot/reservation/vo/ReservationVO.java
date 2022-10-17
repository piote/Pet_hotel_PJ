package com.myboot.reservation.vo;

import org.springframework.stereotype.Component;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Component("reservationVO")
public class ReservationVO {
	private int res_num;
	private String res_st;
	private String res_end;
	private String id;
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
	
	
}
