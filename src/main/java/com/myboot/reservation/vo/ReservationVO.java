package com.myboot.reservation.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

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
	private String pet_name;
	private String user_id;
	private int re_num;
}
