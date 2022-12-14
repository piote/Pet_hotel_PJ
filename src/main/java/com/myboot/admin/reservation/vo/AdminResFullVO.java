package com.myboot.admin.reservation.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("adminresfullVO")
public class AdminResFullVO {
	private int res_num;
	private java.sql.Date res_st;
	private java.sql.Date res_end;
	private String id;
	private String res_comment;
	private String totalCost;
	private java.sql.Date payTime;
	private String res_state;
	
	//펫 총 마리 수
	private int total_pet;
	
	//pet
	private int pet_num;
	private String pet_name;
	private String pet_gender;
	private String room_grade;
	private String service_beauty;
	private String service_spa;
		
	//user
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String tel_sub;
	private String message;
	private Date birth;
	private Date joinDate;
	private String grade;

		
}
