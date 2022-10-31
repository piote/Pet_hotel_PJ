package com.myboot.admin.reservation.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("adminpetserviceVO")
public class AdminPetserviceVO {
	private int pet_num;
	private int res_num;
	private String id;//유저아이디
	private String pet_name;
	private String pet_gender;
	private String room_grade;
	private String service_beauty;
	private String service_spa;

}
