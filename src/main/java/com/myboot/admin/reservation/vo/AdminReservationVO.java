package com.myboot.admin.reservation.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("adminreservationVO")
public class AdminReservationVO {
	private int res_num;
	private Date res_st;
	private Date res_end;
	private String id;
	private String res_comment;
	private String totalCost;
	private String payTime;
	private String res_state;
	
}
