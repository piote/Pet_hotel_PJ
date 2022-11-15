package com.myboot.reservation.vo;

import org.springframework.stereotype.Component;

import com.myboot.mypage.vo.MyPageVO;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Component("petserviceVO")
public class PetserviceVO {
	private int pet_num;
	private int res_num;
	private String id;      //유저아이디
	private String pet_name;
	private String pet_gender;
	private String room_grade;
	private String service_beauty;
	private String service_spa;

}
